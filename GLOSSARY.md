---
terms:
  pt: "Patient"
  ct: "Component"
  fn: "Function"
  pf: "Patient file"
  multiStateDisplayArea: "This has components that can show either the current state or historical state"
  timeOfStateSelectedInHeader: "This gives the time for which :multiStateDisplayArea: should be rendered"
  multiStateDisplayAreaHeader: "This has the slider to choose :timeOfStateSelectedInHeader:"
  cfAge: "computed :fn: age of :ct:"
  mfAge: "method :fn: age of :ct:"
  wfAge: "watch :fn: age of :ct:"
  vsAge: "variable of type string called Age"
  vnAge: "variable of type int called Age"
  arAge: "Array called Age"
  obAge: "Object called Age"
  ctAge: "Age is a :ct:"
  ormAge: "Age is ORM created with vuex-orm"
  psAge: "prop of type string called age in :ct:"
  pnAge: "prop of type number called age in the :ct:"
  paAge: "prop of type array called age in the :ct:"
  poAge: "prop of type object called age in the :ct:"
  dsAge: "data of type string called age in the :ct:"
  dnAge: "data of type number called age in the :ct:"
  daAge: "data of type array called age in the :ct:"
  doAge: "data of type object called age in the :ct:"
---

# Glossary

<Glossary :terms="$frontmatter.terms" />
