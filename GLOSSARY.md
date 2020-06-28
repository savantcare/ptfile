---
terms:
  pt: "Patient"
  ct: "Component"
  fn: "Function"
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
  psAge: "Age is prop of type string in the :ct:"
  pnAge: "Age is prop of type number in the :ct:"
  paAge: "Age is prop of type array in the :ct:"
  poAge: "Age is prop of type object in the :ct:"
  dsAge: "Age is data of type string in the :ct:"
  dnAge: "Age is data of type number in the :ct:"
  daAge: "Age is data of type array in the :ct:"
  doAge: "Age is data of type object in the :ct:"
---

# Glossary

<Glossary :terms="$frontmatter.terms" />
