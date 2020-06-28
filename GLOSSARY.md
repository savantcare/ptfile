---
terms:
  pt: "Patient"
  ct: "Component"
  fn: "Function"
  multiStateDisplayArea: "This has components that can show either the current state or historical state"
  timeOfStateSelectedInHeader: "This gives the time for which :multiStateDisplayArea: should be rendered"
  multiStateDisplayAreaHeader: "This has the slider to choose :timeOfStateSelectedInHeader:"
  cfAge: ":fn: age is defined in computed section of :ct:"
  mfAge: ":fn: age is defined in method section of :ct:"
  wfAge: ":fn: age is defined in watch section of :ct:"
  vsAge: "string variable called Age"
  vnAge: "int variable called Age"
  arAge: "Array called Age"
  obAge: "Object called Age"
  ctAge: "Age is a :ct:"
  ormAge: "Age is a ORM created with vuex-orm"
  pAge: "Age is a prop in the :ct:"
---

# Glossary

<Glossary :terms="$frontmatter.terms" />
