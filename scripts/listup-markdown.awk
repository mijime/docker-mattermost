function camel2snake(str) {
  if (match(str, /(.*)([a-z0-9]+)([A-Z]+)(.*)/, cap))
    return camel2snake(cap[1] cap[2] "_" tolower(cap[3]) cap[4]);

  return str;
}

function fixWord(str) {
  if (match(str, /(.*)(SMTP)([A-Z]+)(.*)/, cap))
    return fixWord(cap[1] "Smtp" "_" tolower(cap[3]) cap[4]);

  if (match(str, /(.*)(GitLab)([A-Z]+)(.*)/, cap))
    return fixWord(cap[1] "Gitlab" "_" tolower(cap[3]) cap[4]);

  return str;
}

/^ *"([[:alnum:]]+)Settings": {$/ {
  match($0, /^ *"([[:alnum:]]+)Settings": {$/, s);
  printf "\n### %sSettings\n\n", s[1];
  printf "| %s | %s | %s |\n", "configuration name", "env", "default";
  printf "| :--- | :--- | :--- |\n";
  next;
}

/^ *"([[:alnum:]]+)": +(-?[0-9]+|true|false|[[]]+)?(".*")?(,)?$/ {
  match($0, /^ *"([[:alnum:]]+)": +(-?[0-9]+|true|false|[[]]+|".*")?,?$/, v);
  envkey = toupper(s[1] "_" camel2snake(fixWord(v[1])));
  printf "| %s | %s | %s |\n", v[1], envkey, v[2];
  next;
}
