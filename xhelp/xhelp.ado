*! ==================================================================
*!       xhelp to create and view translated help files
*! ==================================================================
*! version 0.1, 2022-06-20, yyzeng <zzyy@xmu.edu.cn>
*! ==================================================================

program xhelp
  version 9
  syntax [anything(everything)]           ///
         [, noNew name(name) MARKer(name) ///
            Lang(string) edit noIHLP Personal]
  
  if "`edit'" == "edit" & "`new'`name'`marker'" != "" {
    di as err "-edit- and view options " _c
    error 184
  }
  
  if "`lang'" == "" {  // "zh" by default
    local lang = "zh"
  }
  
  // parsing `anything' into local hlp
  local anything = stritrim("`anything'")
  parse_ `anything'
  local hlp = r(hlp)
  
  if "`edit'" == "edit" {  // edit mode
    if wordcount(`"`hlp'"') >= 2 {
      di as err `"{it:`anything'} isn't a valid .sthlp name;"'
      di         "option {it:command_or_topic_name} incorrectly specified. " _c
      exit 197
    }
    xhelp_edit `hlp', lang(`lang') `ihlp' `personal'
  }
  else { // view mode
    capture findfile `hlp'_`lang'.sthlp
    if _rc == 0 { // `hlp'_`lang'.sthlp exists, pass-through to {cmd:help}
      help `hlp'_`lang', `new' name(`name') marker(`marker')
    }
    else { // `hlp'_`lang'.sthlp not found, return adequate message
      if "`lang'" == "zh" {
        di as txt "未能找到翻译版帮助文档；" _c
        di        "出现在浏览器窗口的信息是 {cmd:help {it:`anything'}} 的结果。"
      }
      else {
        di as txt "The translated help file can't be found; " _c
        di        "display {cmd:help {it:`anything'}} in Viewer instead."
      }
      help `anything', `new' name(`name') marker(`marker')
    }
  }

end


// ********************************************************
// subprogram: parse_
//             parse `anything' into the returned r(hlp)
// --------------------------------------------------------
program define parse_, rclass
  syntax [anything]
  
  if strpos(`"`anything'"', `"""') {
    di as err `"{it:command_or_topic_name} can't include quotes. "'
    exit 197
  }
  
  local typed_help = subinstr("`anything'", " ", "_", .)
  
  // s1. ""
  if "`typed_help'" == "" {
    return local hlp = "help_advice"
    return local stp = "s1"
    exit
  }
  
  // s2. h
  if "`typed_help'" == "h" {
    return local hlp = "help"
    return local stp = "s2"
    exit
  }
  
  // s3. functions *()
  if regexm("`typed_help'", "\( ?\)$") {
    local hlp = regexr("`typed_help'", "\( ?\)$", "")
    return local hlp = "f_`hlp'"
    return local stp = "s3"
    exit
  }
  
  // s4. commandname or abbreviation
  capture unabcmd `typed_help'
  if _rc == 0 {
    local hlp = r(cmd)
    capture findfile `hlp'.sthlp
    if _rc == 0 {
      return local hlp `hlp'
      return local stp = "s4"
      exit
    }
  }
  
  // s5. exact .sthlp filename
  capture findfile `typed_help'.sthlp
  if _rc == 0 {
    return local hlp `typed_help'
    return local stp = "s5"
    exit
  }

  // s6. go to ?help_alias.maint for commandname alias
  local f_letter = substr("`typed_help'", 1, 1)
  local f_maint  = "`f_letter'help_alias.maint"
  capture findfile `f_maint'
  if _rc == 0 {
    quietly mata de_alias("`typed_help'", `"`r(fn)'"')
    if "`de_alias_help'" != "" {
      return local hlp = "`de_alias_help'"
      return local stp = "s6"
      exit
    }
  }
    
  // s7. else ...
  return local hlp `"`anything'"'
  return local stp = "s7"
  exit
  
end

local TESTIT = 0   // turn on/off unit-test -parse_-
if `TESTIT' == 1 { // unit-test -parse_-
  * s1. ""
  parse_
    assert r(hlp) == "help_advice" & r(stp) == "s1"
  * s2. "h"
  parse_ h
    assert r(hlp) == "help" & r(stp) == "s2"
  * s3. *()
  parse_ sum()
    assert r(hlp) == "f_sum" & r(stp) == "s3"
  parse_ x()
    assert r(hlp) == "f_x" & r(stp) == "s3"
  * s4. commandname or abbreviation
  parse_ su
    assert r(hlp) == "summarize" & r(stp) == "s4"
  parse_ g
    assert r(hlp) == "generate" & r(stp) == "s4"
  parse_ xhelp
    assert r(hlp) == "xhelp" & r(stp) == "s4"
  * s5. exact .sthlp filename
  parse_ estimation commands
    assert r(hlp) == "estimation_commands" & r(stp) == "s5"
  parse_ f sum
    assert r(hlp) == "f_sum" & r(stp) == "s5"
  * s6. commandname alias
  parse_ _n
    assert r(hlp) == "_variables" & r(stp) == "s6"
  parse_ he
    assert r(hlp) == "help" & r(stp) == "s6"
  parse_ halfyear
    assert r(hlp) == "f_halfyear" & r(stp) == "s6"
  parse_ hettest
    assert r(hlp) == "ovtest" & r(stp) == "s6"
  * s7. else ...
  parse_ repl
    assert r(hlp) == "repl" & r(stp) == "s7"
  parse_ importing
    assert r(hlp) == "importing" & r(stp) == "s7"
  parse_ import exc
    assert r(hlp) == "import exc" & r(stp) == "s7"
}

// ********************************************************
// subprogram: xhelp_edit
//             copy and edit (translate) the `hlp'.sthlp
// --------------------------------------------------------
program define xhelp_edit
  syntax anything(name = hlp), lang(string) [noIHLP personal]
  
  find_copy_edit `hlp'.sthlp, lang(`lang') `personal'
  if "`ihlp'" != "noihlp" {  // the INCLUDED *.ihlp
    ihlps `hlp'.sthlp, lang(`lang') `personal'
  }
  
end

// ********************************************************
// subprogram: find_copy_edit
//             find, copy and edit (translate) the named file
// --------------------------------------------------------
program define find_copy_edit
  syntax anything(name=FILE), lang(string) [personal]
  
  local sthlp = strpos("`FILE'", ".sthlp")
  
  capture findfile `FILE'
  local rfn `"`r(fn)'"'
  if _rc == 0 { // `FILE' exists
    if `sthlp' {
      local tgt  = subinstr("`FILE'", ".sthlp", "_`lang'.sthlp", 1)
      local hlp_ = subinstr("`tgt'", ".sthlp", "", 1)
      local hlp  = subinstr("`hlp_'", "_`lang'", "", 1)
    }
    else if strpos("`FILE'", ".ihlp") {
      local tgt = subinstr("`FILE'", ".ihlp", "_`lang'.ihlp", 1)
    }
    
    capture findfile `tgt'
    if _rc == 0 { // `tgt' exists
      di as txt `"- {it:`r(fn)'} already exists;"'
      di         "- {it:`tgt'} is opened for your editing ..." _n
      doedit `"`r(fn)'"'
      if `sthlp' help `hlp_'
    }
    else { // `tgt' not found
      if "`personal'" == "personal" {
        local p : sysdir PERSONAL
      }
      
      local ptgt = `"`p'`tgt'"'
      if `sthlp' {
        add_lines_to `"`rfn'"', saving(`"`ptgt'"') lang(`lang') hlp(`hlp')
      }
      else copy `"`rfn'"' `"`ptgt'"'
      
      if "`personal'" == "personal" {
        di as txt `"- {it:`FILE'} is COPIED to the {browse "`p'":PERSONAL} adopath"'
      }
      else {
        di as txt `"- {it:`FILE'} is COPIED to the current working directory"'
      }
      di           "  and rename as {it:`tgt'};"
      di           "- {it:`tgt'} is opened for your editing ..." _n
      doedit `"`ptgt'"'
      if `sthlp' help `hlp_'
    }
  }
  else { // `FILE' not found
    di as err `"{it:`FILE'} not found; "'
    if !`sthlp' {
      exit 601
    }
    else {
      di "option {it:command_or_topic_name} incorrectly specified. "
      exit 197
    }
  }
  
end

// ********************************************************
// subprogram: add_lines_to
//             add lines to the edited `hlp'_`lang'.sthlp
// --------------------------------------------------------
program define add_lines_to
  syntax anything(name=FFILE), saving(string) lang(string) hlp(string)
  
  // s1: add English Version link
  local viewer_bgn   = 0
  local p2colset_bgn = 0
  local add_ev       = 0
  
  tempname fh_r
  tempname fh_w
  file open `fh_r' using `FFILE', read
  file open `fh_w' using `saving', write replace
  file read `fh_r' line
  while r(eof) == 0 {
    if `add_ev' == 0 {
      if `viewer_bgn' == 0 & strpos(`"`line'"', "{viewer") == 1 {
        local viewer_bgn = 1
      }
      if `viewer_bgn' == 1 & strpos(`"`line'"', "{viewer") == 0 {
        local viewer_bgn = 2  // exit
      }
      if `p2colset_bgn' == 0 & strpos(`"`line'"', "{p2colset") == 1 {
        local p2colset_bgn = 1
      }
      if (`viewer_bgn' == 2 | `p2colset_bgn' == 1) {
        file write `fh_w' "{help `hlp':English Version}" _n
        file write `fh_w' "{hline}" _n
        local add_ev = 1
      }
    }
    file write `fh_w' `"`macval(line)'"' _n
    file read `fh_r' line
  }
  file close `fh_r'
  
  // append closing lines
  local today: di %tdCCYY-NN-DD date(c(current_date), "DMY")
  local me  = c(username)
  
  file write `fh_w' _n "{.-}" _n
  if "`lang'" == "zh" {
    file write `fh_w' "{center:v1.0 `today', `me' (机构, 邮箱)}" _n
    file write `fh_w' "{center:翻译自Stata官方帮助文档 <`hlp'.sthlp>}" _n
  }
  else {
    file write `fh_w' "{center:v1.0 `today', `me' (institution, email@gg.com)}" _n
    file write `fh_w' "{center:Translated from Stata official <`hlp'.sthlp>}" _n
  }
  file close `fh_w'
  
end

// ********************************************************
// subprogram: ihlps
//             find, copy and edit (translate) the included *.ihlp
// --------------------------------------------------------
program define ihlps
  syntax anything(name=FILE), lang(string) [personal]
  
  capture findfile `FILE'
  if _rc == 0 { // `FILE' exists
    tempname fh
    file open `fh' using `"`r(fn)'"', read
    file read `fh' line
    while r(eof)==0 {
      if ustrregexm(stritrim(`"`line'"'), "INCLUDE help ([^ ]{1,30})") == 1 {
        find_copy_edit `=ustrregexs(1)'.ihlp, lang(`lang') `personal'
      }
      file read `fh' line
    }
  }
  
end

// ********************************************************
// subprogram: de_alias(typed_help)
//             de_alias the type-ined help's name
// --------------------------------------------------------

set matastrict on

mata:

version 9
mata clear

void function de_alias(string scalar thelp, string scalar f_maint) {
  string scalar hlp
  string vector lookupV
  
  lookupV = J(0, 1, "")
  lookupV = cat(f_maint)
  lookupV = strtrim(lookupV)
  lookupV = select(lookupV, ustrregexm(lookupV, "^"+thelp+char(9)):==1)
  hlp = ""
  if(rows(lookupV) == 1) { // only one row matched
    hlp = ustrregexrf(lookupV, "^"+thelp+char(9)+"+", "")
  }
  st_local("de_alias_help", hlp)
}

end

exit
