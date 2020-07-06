use sc_mental_status_exam;

CREATE TABLE `affect`
(
  `patientUUID` char
(36) NOT NULL,
  `euthymic` ENUM
('yes','no') NOT NULL DEFAULT 'no',
  `dysphoric` ENUM
('yes','no') NOT NULL DEFAULT 'no',
  `irritable` ENUM
('yes','no') NOT NULL DEFAULT 'no',
  `angry` ENUM
('yes','no') NOT NULL DEFAULT 'no',
  `bright` ENUM
('yes','no') NOT NULL DEFAULT 'no',
  `euphoric` ENUM
('yes','no') NOT NULL DEFAULT 'no',
  `labile` ENUM
('yes','no') NOT NULL DEFAULT 'no',
  `stable` ENUM
('yes','no') NOT NULL DEFAULT 'no',
  `mood-congruent` ENUM
('yes','no') NOT NULL DEFAULT 'no',
  `mood-incongruent` ENUM
('yes','no') NOT NULL DEFAULT 'no',
  `expansive` ENUM
('yes','no') NOT NULL DEFAULT 'no',
  `full-range` ENUM
('yes','no') NOT NULL DEFAULT 'no',
  `constricted` ENUM
('yes','no') NOT NULL DEFAULT 'no',
  `blunted` ENUM
('yes','no') NOT NULL DEFAULT 'no',
  `flat` ENUM
('yes','no') NOT NULL DEFAULT 'no',
  `anxious` ENUM
('yes','no') NOT NULL DEFAULT 'no',
  `tearful` ENUM
('yes','no') NOT NULL DEFAULT 'no',
  `other` text NOT NULL,
  `dysthymic` ENUM
('yes','no') NOT NULL DEFAULT 'no',
  `recordChangedByUUID` char
(36) NOT NULL,
  `recordChangedFromIPAddress` varchar
(20) NOT NULL,
`timeOfEvaluation` DATETIME NOT NULL,
  PRIMARY KEY
(`patientUUID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1
WITH SYSTEM VERSIONING;

-- --------------------------------------------------------

--
-- Table structure for table `appearence`
--

CREATE TABLE `appearence`
(
  `patientUUID` char
(36) NOT NULL,
  `good-grooming-and-hygiene` ENUM
('yes','no') NOT NULL DEFAULT 'no',
  `no-apparent-distress` ENUM
('yes','no') NOT NULL DEFAULT 'no',
  `well-developed-well-nourished` ENUM
('yes','no') NOT NULL DEFAULT 'no',
  `appears-stated-age` ENUM
('yes','no') NOT NULL DEFAULT 'no',
  `appears-younger-then-stated-age` ENUM
('yes','no') NOT NULL DEFAULT 'no',
  `appears-older-then-stated-age` ENUM
('yes','no') NOT NULL DEFAULT 'no',
  `obese` ENUM
('yes','no') NOT NULL DEFAULT 'no',
  `thin-or-cachetic` ENUM
('yes','no') NOT NULL DEFAULT 'no',
  `disheveled-unkempt` ENUM
('yes','no') NOT NULL DEFAULT 'no',
  `malodorus` ENUM
('yes','no') NOT NULL DEFAULT 'no',
  `others` text NOT NULL,
  `recordChangedByUUID` char
(36) NOT NULL,
  `recordChangedFromIPAddress` varchar
(20) NOT NULL,
`timeOfEvaluation` DATETIME NOT NULL,
  PRIMARY KEY
(`patientUUID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1
WITH SYSTEM VERSIONING;

-- --------------------------------------------------------

--
-- Table structure for table `attitude`
--

CREATE TABLE `attitude`
(
  `patientUUID` char
(36) NOT NULL,
  `pleasant-and-cooperative` ENUM
('yes','no') NOT NULL DEFAULT 'no',
  `uncooperative` ENUM
('yes','no') NOT NULL DEFAULT 'no',
  `hostile-or-defiant` ENUM
('yes','no') NOT NULL DEFAULT 'no',
  `guarded` ENUM
('yes','no') NOT NULL DEFAULT 'no',
  `evasive` ENUM
('yes','no') NOT NULL DEFAULT 'no',
  `apathetic` ENUM
('yes','no') NOT NULL DEFAULT 'no',
  `disorganized-behavior` ENUM
('yes','no') NOT NULL DEFAULT 'no',
  `other` text NOT NULL,
  `recordChangedByUUID` char
(36) NOT NULL,
  `recordChangedFromIPAddress` varchar
(20) NOT NULL,
`timeOfEvaluation` DATETIME NOT NULL,
  PRIMARY KEY
(`patientUUID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1
WITH SYSTEM VERSIONING;

-- --------------------------------------------------------

--
-- Table structure for table `cognition`
--

CREATE TABLE `cognition`
(
  `patientUUID` char
(36) NOT NULL,
  `grossly-intact-no-memory-impairment-adequate-fund-of-knowledge-n` ENUM
('yes','no') NOT NULL DEFAULT 'no',
  `impaired` ENUM
('yes','no') NOT NULL DEFAULT 'no',
  `fluctuating` ENUM
('yes','no') NOT NULL DEFAULT 'no',
  `other` text NOT NULL,
  `recordChangedByUUID` char
(36) NOT NULL,
  `recordChangedFromIPAddress` varchar
(20) NOT NULL,
`timeOfEvaluation` DATETIME NOT NULL,
  PRIMARY KEY
(`patientUUID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1
WITH SYSTEM VERSIONING;

-- --------------------------------------------------------

--
-- Table structure for table `constitutional`
--

CREATE TABLE `constitutional`
(
  `patientUUID` char
(36) NOT NULL,
  `vitals-signs-stable` ENUM
('yes','no') NOT NULL DEFAULT 'no',
  `other` text NOT NULL,
  `recordChangedByUUID` char
(36) NOT NULL,
  `recordChangedFromIPAddress` varchar
(20) NOT NULL,
`timeOfEvaluation` DATETIME NOT NULL,
  PRIMARY KEY
(`patientUUID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1
WITH SYSTEM VERSIONING;

-- --------------------------------------------------------

--
-- Table structure for table `eye-contact`
--

CREATE TABLE `eye-contact`
(
  `patientUUID` char
(36) NOT NULL,
  `appropriate` ENUM
('yes','no') NOT NULL DEFAULT 'no',
  `downcast` ENUM
('yes','no') NOT NULL DEFAULT 'no',
  `intense` ENUM
('yes','no') NOT NULL DEFAULT 'no',
  `fleeting` ENUM
('yes','no') NOT NULL DEFAULT 'no',
  `other` text NOT NULL,
  `recordChangedByUUID` char
(36) NOT NULL,
  `recordChangedFromIPAddress` varchar
(20) NOT NULL,
`timeOfEvaluation` DATETIME NOT NULL,
  PRIMARY KEY
(`patientUUID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1
WITH SYSTEM VERSIONING;

-- --------------------------------------------------------

--
-- Table structure for table `impulse-control`
--

CREATE TABLE `impulse-control`
(
  `patientUUID` char
(36) NOT NULL,
  `good` ENUM
('yes','no') NOT NULL DEFAULT 'no',
  `fair` ENUM
('yes','no') NOT NULL DEFAULT 'no',
  `questionable` ENUM
('yes','no') NOT NULL DEFAULT 'no',
  `poor` ENUM
('yes','no') NOT NULL DEFAULT 'no',
  `impaired` ENUM
('yes','no') NOT NULL DEFAULT 'no',
  `limited` ENUM
('yes','no') NOT NULL DEFAULT 'no',
  `other` text NOT NULL,
  `recordChangedByUUID` char
(36) NOT NULL,
  `recordChangedFromIPAddress` varchar
(20) NOT NULL,
`timeOfEvaluation` DATETIME NOT NULL,
  PRIMARY KEY
(`patientUUID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1
WITH SYSTEM VERSIONING;

-- --------------------------------------------------------

--
-- Table structure for table `insight`
--

CREATE TABLE `insight`
(
  `patientUUID` char
(36) NOT NULL,
  `good` ENUM
('yes','no') NOT NULL DEFAULT 'no',
  `fair` ENUM
('yes','no') NOT NULL DEFAULT 'no',
  `questionable` ENUM
('yes','no') NOT NULL DEFAULT 'no',
  `poor` ENUM
('yes','no') NOT NULL DEFAULT 'no',
  `impaired` ENUM
('yes','no') NOT NULL DEFAULT 'no',
  `limited` ENUM
('yes','no') NOT NULL DEFAULT 'no',
  `other` text NOT NULL,
  `recordChangedByUUID` char
(36) NOT NULL,
  `recordChangedFromIPAddress` varchar
(20) NOT NULL,
`timeOfEvaluation` DATETIME NOT NULL,
  PRIMARY KEY
(`patientUUID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1
WITH SYSTEM VERSIONING;

-- --------------------------------------------------------

--
-- Table structure for table `judgement`
--

CREATE TABLE `judgement`
(
  `patientUUID` char
(36) NOT NULL,
  `good` ENUM
('yes','no') NOT NULL DEFAULT 'no',
  `fair` ENUM
('yes','no') NOT NULL DEFAULT 'no',
  `questionable` ENUM
('yes','no') NOT NULL DEFAULT 'no',
  `poor` ENUM
('yes','no') NOT NULL DEFAULT 'no',
  `impaired` ENUM
('yes','no') NOT NULL DEFAULT 'no',
  `limited` ENUM
('yes','no') NOT NULL DEFAULT 'no',
  `other` text NOT NULL,
  `recordChangedByUUID` char
(36) NOT NULL,
  `recordChangedFromIPAddress` varchar
(20) NOT NULL,
`timeOfEvaluation` DATETIME NOT NULL,
  PRIMARY KEY
(`patientUUID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1
WITH SYSTEM VERSIONING;

-- --------------------------------------------------------

--
-- Table structure for table `neurological`
--

CREATE TABLE `neurological`
(
  `patientUUID` char
(36) NOT NULL,
  `gait-and-station-normal` ENUM
('yes','no') NOT NULL DEFAULT 'no',
  `gait-and-station-abnormal` ENUM
('yes','no') NOT NULL DEFAULT 'no',
  `other` text NOT NULL,
  `recordChangedByUUID` char
(36) NOT NULL,
  `recordChangedFromIPAddress` varchar
(20) NOT NULL,
`timeOfEvaluation` DATETIME NOT NULL,
  PRIMARY KEY
(`patientUUID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1
WITH SYSTEM VERSIONING;

-- --------------------------------------------------------

--
-- Table structure for table `perception`
--

CREATE TABLE `perception`
(
  `patientUUID` char
(36) NOT NULL,
  `no-avh` ENUM
('yes','no') NOT NULL DEFAULT 'no',
  `ah` ENUM
('yes','no') NOT NULL DEFAULT 'no',
  `command-ah` ENUM
('yes','no') NOT NULL DEFAULT 'no',
  `vh` ENUM
('yes','no') NOT NULL DEFAULT 'no',
  `other` text NOT NULL,
  `recordChangedByUUID` char
(36) NOT NULL,
  `recordChangedFromIPAddress` varchar
(20) NOT NULL,
`timeOfEvaluation` DATETIME NOT NULL,
  PRIMARY KEY
(`patientUUID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1
WITH SYSTEM VERSIONING;

-- --------------------------------------------------------

--
-- Table structure for table `psychomotor`
--

CREATE TABLE `psychomotor`
(
  `patientUUID` char
(36) NOT NULL,
  `normal` ENUM
('yes','no') NOT NULL DEFAULT 'no',
  `agitated` ENUM
('yes','no') NOT NULL DEFAULT 'no',
  `retarded` ENUM
('yes','no') NOT NULL DEFAULT 'no',
  `other` text NOT NULL,
  `recordChangedByUUID` char
(36) NOT NULL,
  `recordChangedFromIPAddress` varchar
(20) NOT NULL,
`timeOfEvaluation` DATETIME NOT NULL,
  PRIMARY KEY
(`patientUUID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1
WITH SYSTEM VERSIONING;

-- --------------------------------------------------------

--
-- Table structure for table `speech`
--

CREATE TABLE `speech`
(
  `patientUUID` char
(36) NOT NULL,
  `regular-rate-and-rhythm` ENUM
('yes','no') NOT NULL DEFAULT 'no',
  `fluent` ENUM
('yes','no') NOT NULL DEFAULT 'no',
  `incoherent` ENUM
('yes','no') NOT NULL DEFAULT 'no',
  `talkative` ENUM
('yes','no') NOT NULL DEFAULT 'no',
  `pressured` ENUM
('yes','no') NOT NULL DEFAULT 'no',
  `mumbling` ENUM
('yes','no') NOT NULL DEFAULT 'no',
  `other` text NOT NULL,
  `recordChangedByUUID` char
(36) NOT NULL,
  `recordChangedFromIPAddress` varchar
(20) NOT NULL,
`timeOfEvaluation` DATETIME NOT NULL,
  PRIMARY KEY
(`patientUUID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1
WITH SYSTEM VERSIONING;

-- --------------------------------------------------------

--
-- Table structure for table `thought-content`
--

CREATE TABLE `thought-content`
(
  `patientUUID` char
(36) NOT NULL,
  `no-si-intent-or-plan` ENUM
('yes','no') NOT NULL DEFAULT 'no',
  `no-passive-death-wish` ENUM
('yes','no') NOT NULL DEFAULT 'no',
  `no-hi-intent-or-plan` ENUM
('yes','no') NOT NULL DEFAULT 'no',
  `no-delusional-thinking-observed` ENUM
('yes','no') NOT NULL DEFAULT 'no',
  `no-obsessive-thinking-observed` ENUM
('yes','no') NOT NULL DEFAULT 'no',
  `ruminations` ENUM
('yes','no') NOT NULL DEFAULT 'no',
  `si-without-intent-or-plan` ENUM
('yes','no') NOT NULL DEFAULT 'no',
  `si-as-detailed-below` ENUM
('yes','no') NOT NULL DEFAULT 'no',
  `hi-as-detailed-below` ENUM
('yes','no') NOT NULL DEFAULT 'no',
  `delusions` ENUM
('yes','no') NOT NULL DEFAULT 'no',
  `ior` ENUM
('yes','no') NOT NULL DEFAULT 'no',
  `obsessions` ENUM
('yes','no') NOT NULL DEFAULT 'no',
  `passive-death-wish` ENUM
('yes','no') NOT NULL DEFAULT 'no',
  `other` text NOT NULL,
  `recordChangedByUUID` char
(36) NOT NULL,
  `recordChangedFromIPAddress` varchar
(20) NOT NULL,
`timeOfEvaluation` DATETIME NOT NULL,
  PRIMARY KEY
(`patientUUID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1
WITH SYSTEM VERSIONING;

-- --------------------------------------------------------

--
-- Table structure for table `thought-process`
--

CREATE TABLE `thought-process`
(
  `patientUUID` char
(36) NOT NULL,
  `linear-logical-and-goal-directed` ENUM
('yes','no') NOT NULL DEFAULT 'no',
  `disorganized` ENUM
('yes','no') NOT NULL DEFAULT 'no',
  `circumstantial` ENUM
('yes','no') NOT NULL DEFAULT 'no',
  `tangential` ENUM
('yes','no') NOT NULL DEFAULT 'no',
  `looseness-of-associations` ENUM
('yes','no') NOT NULL DEFAULT 'no',
  `flight-of-ideas` ENUM
('yes','no') NOT NULL DEFAULT 'no',
  `poverty-of-thought` ENUM
('yes','no') NOT NULL DEFAULT 'no',
  `other` text NOT NULL,
  `recordChangedByUUID` char
(36) NOT NULL,
  `recordChangedFromIPAddress` varchar
(20) NOT NULL,
`timeOfEvaluation` DATETIME NOT NULL,
  PRIMARY KEY
(`patientUUID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1
WITH SYSTEM VERSIONING;

