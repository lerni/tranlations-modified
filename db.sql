-- phpMyAdmin SQL Dump
-- version 5.2.2
-- https://www.phpmyadmin.net/
--
-- Host: db:3306
-- Erstellungszeit: 23. Jun 2025 um 12:31
-- Server-Version: 10.6.21-MariaDB-ubu2004-log
-- PHP-Version: 8.2.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Datenbank: `db`
--

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `Blog`
--

CREATE TABLE `Blog` (
  `ID` int(11) NOT NULL,
  `PostsPerPage` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `BlogCategory`
--

CREATE TABLE `BlogCategory` (
  `ID` int(11) NOT NULL,
  `ClassName` enum('SilverStripe\\Blog\\Model\\BlogCategory') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'SilverStripe\\Blog\\Model\\BlogCategory',
  `LastEdited` datetime DEFAULT NULL,
  `Created` datetime DEFAULT NULL,
  `Title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `URLSegment` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `BlogID` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `BlogCategory_Localised`
--

CREATE TABLE `BlogCategory_Localised` (
  `ID` int(11) NOT NULL,
  `RecordID` int(11) NOT NULL DEFAULT 0,
  `Locale` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `URLSegment` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `BlogPost`
--

CREATE TABLE `BlogPost` (
  `ID` int(11) NOT NULL,
  `PublishDate` datetime DEFAULT NULL,
  `AuthorNames` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Summary` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `FeaturedImageID` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `BlogPost_Authors`
--

CREATE TABLE `BlogPost_Authors` (
  `ID` int(11) NOT NULL,
  `BlogPostID` int(11) NOT NULL DEFAULT 0,
  `MemberID` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `BlogPost_Categories`
--

CREATE TABLE `BlogPost_Categories` (
  `ID` int(11) NOT NULL,
  `BlogPostID` int(11) NOT NULL DEFAULT 0,
  `BlogCategoryID` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `BlogPost_Live`
--

CREATE TABLE `BlogPost_Live` (
  `ID` int(11) NOT NULL,
  `PublishDate` datetime DEFAULT NULL,
  `AuthorNames` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Summary` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `FeaturedImageID` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `BlogPost_Localised`
--

CREATE TABLE `BlogPost_Localised` (
  `ID` int(11) NOT NULL,
  `RecordID` int(11) NOT NULL DEFAULT 0,
  `Locale` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `AuthorNames` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Summary` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `BlogPost_Localised_Live`
--

CREATE TABLE `BlogPost_Localised_Live` (
  `ID` int(11) NOT NULL,
  `RecordID` int(11) NOT NULL DEFAULT 0,
  `Locale` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `AuthorNames` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Summary` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `BlogPost_Localised_Versions`
--

CREATE TABLE `BlogPost_Localised_Versions` (
  `Version` int(11) NOT NULL DEFAULT 0,
  `ID` int(11) NOT NULL,
  `RecordID` int(11) NOT NULL DEFAULT 0,
  `Locale` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `AuthorNames` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Summary` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `BlogPost_Tags`
--

CREATE TABLE `BlogPost_Tags` (
  `ID` int(11) NOT NULL,
  `BlogPostID` int(11) NOT NULL DEFAULT 0,
  `BlogTagID` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `BlogPost_Versions`
--

CREATE TABLE `BlogPost_Versions` (
  `ID` int(11) NOT NULL,
  `RecordID` int(11) NOT NULL DEFAULT 0,
  `Version` int(11) NOT NULL DEFAULT 0,
  `PublishDate` datetime DEFAULT NULL,
  `AuthorNames` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Summary` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `FeaturedImageID` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `BlogTag`
--

CREATE TABLE `BlogTag` (
  `ID` int(11) NOT NULL,
  `ClassName` enum('SilverStripe\\Blog\\Model\\BlogTag') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'SilverStripe\\Blog\\Model\\BlogTag',
  `LastEdited` datetime DEFAULT NULL,
  `Created` datetime DEFAULT NULL,
  `Title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `URLSegment` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `BlogID` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `Blog_Contributors`
--

CREATE TABLE `Blog_Contributors` (
  `ID` int(11) NOT NULL,
  `BlogID` int(11) NOT NULL DEFAULT 0,
  `MemberID` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `Blog_Editors`
--

CREATE TABLE `Blog_Editors` (
  `ID` int(11) NOT NULL,
  `BlogID` int(11) NOT NULL DEFAULT 0,
  `MemberID` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `Blog_Live`
--

CREATE TABLE `Blog_Live` (
  `ID` int(11) NOT NULL,
  `PostsPerPage` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `Blog_Versions`
--

CREATE TABLE `Blog_Versions` (
  `ID` int(11) NOT NULL,
  `RecordID` int(11) NOT NULL DEFAULT 0,
  `Version` int(11) NOT NULL DEFAULT 0,
  `PostsPerPage` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `Blog_Writers`
--

CREATE TABLE `Blog_Writers` (
  `ID` int(11) NOT NULL,
  `BlogID` int(11) NOT NULL DEFAULT 0,
  `MemberID` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `ChangeSet`
--

CREATE TABLE `ChangeSet` (
  `ID` int(11) NOT NULL,
  `ClassName` enum('SilverStripe\\Versioned\\ChangeSet') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'SilverStripe\\Versioned\\ChangeSet',
  `LastEdited` datetime DEFAULT NULL,
  `Created` datetime DEFAULT NULL,
  `Name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `State` enum('open','published','reverted') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'open',
  `IsInferred` tinyint(1) UNSIGNED NOT NULL DEFAULT 0,
  `Description` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `PublishDate` datetime DEFAULT NULL,
  `LastSynced` datetime DEFAULT NULL,
  `OwnerID` int(11) NOT NULL DEFAULT 0,
  `PublisherID` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Daten für Tabelle `ChangeSet`
--

INSERT INTO `ChangeSet` (`ID`, `ClassName`, `LastEdited`, `Created`, `Name`, `State`, `IsInferred`, `Description`, `PublishDate`, `LastSynced`, `OwnerID`, `PublisherID`) VALUES
(1, 'SilverStripe\\Versioned\\ChangeSet', '2025-06-23 14:14:39', '2025-06-23 14:14:39', 'Generiert durch Veröffentlichung von \'Deutsch (Schweiz)\' am 23.06.2025, 14:14', 'published', 1, NULL, '2025-06-23 14:14:39', '2025-06-23 14:14:39', 0, 1),
(2, 'SilverStripe\\Versioned\\ChangeSet', '2025-06-23 14:15:36', '2025-06-23 14:15:36', 'Generiert durch Veröffentlichung von \'EN\' am 23.06.2025, 14:15', 'published', 1, NULL, '2025-06-23 14:15:36', '2025-06-23 14:15:36', 0, 1),
(3, 'SilverStripe\\Versioned\\ChangeSet', '2025-06-23 14:15:47', '2025-06-23 14:15:47', 'Generiert durch Veröffentlichung von \'DE\' am 23.06.2025, 14:15', 'published', 1, NULL, '2025-06-23 14:15:47', '2025-06-23 14:15:47', 0, 1),
(4, 'SilverStripe\\Versioned\\ChangeSet', '2025-06-23 14:21:30', '2025-06-23 14:21:30', 'Generiert durch Veröffentlichung von \'Home\' am 23.06.2025, 14:21', 'published', 1, NULL, '2025-06-23 14:21:30', '2025-06-23 14:21:30', 0, 1),
(5, 'SilverStripe\\Versioned\\ChangeSet', '2025-06-23 14:22:02', '2025-06-23 14:22:02', 'Generiert durch Veröffentlichung von \'Home\' am 23.06.2025, 14:22', 'published', 1, NULL, '2025-06-23 14:22:02', '2025-06-23 14:22:02', 0, 1),
(6, 'SilverStripe\\Versioned\\ChangeSet', '2025-06-23 14:24:00', '2025-06-23 14:24:00', 'Generiert durch Veröffentlichung von \'The sun painted gentle patterns\' am 23.06.2025, 14:24', 'published', 1, NULL, '2025-06-23 14:24:00', '2025-06-23 14:24:00', 0, 1),
(7, 'SilverStripe\\Versioned\\ChangeSet', '2025-06-23 14:24:07', '2025-06-23 14:24:07', 'Generiert durch Veröffentlichung von \'Home\' am 23.06.2025, 14:24', 'published', 1, NULL, '2025-06-23 14:24:07', '2025-06-23 14:24:07', 0, 1);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `ChangeSetItem`
--

CREATE TABLE `ChangeSetItem` (
  `ID` int(11) NOT NULL,
  `ClassName` enum('SilverStripe\\Versioned\\ChangeSetItem') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'SilverStripe\\Versioned\\ChangeSetItem',
  `LastEdited` datetime DEFAULT NULL,
  `Created` datetime DEFAULT NULL,
  `VersionBefore` int(11) NOT NULL DEFAULT 0,
  `VersionAfter` int(11) NOT NULL DEFAULT 0,
  `Added` enum('explicitly','implicitly') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'implicitly',
  `ChangeSetID` int(11) NOT NULL DEFAULT 0,
  `ObjectID` int(11) NOT NULL DEFAULT 0,
  `ObjectClass` enum('SilverStripe\\Assets\\File','SilverStripe\\SiteConfig\\SiteConfig','SilverStripe\\Versioned\\ChangeSet','SilverStripe\\Versioned\\ChangeSetItem','DNADesign\\Elemental\\Models\\BaseElement','DNADesign\\Elemental\\Models\\ElementalArea','SilverStripe\\Assets\\Shortcodes\\FileLink','SilverStripe\\Blog\\Model\\BlogCategory','SilverStripe\\Blog\\Model\\BlogTag','SilverStripe\\CMS\\Model\\SiteTree','SilverStripe\\CMS\\Model\\SiteTreeLink','SilverStripe\\Security\\Group','SilverStripe\\Security\\LoginAttempt','SilverStripe\\Security\\Member','SilverStripe\\Security\\MemberPassword','SilverStripe\\Security\\Permission','SilverStripe\\Security\\PermissionRole','SilverStripe\\Security\\PermissionRoleCode','SilverStripe\\Security\\RememberLoginHash','SilverStripe\\UserForms\\Model\\EditableCustomRule','SilverStripe\\UserForms\\Model\\EditableFormField','TractorCow\\Fluent\\Model\\Domain','TractorCow\\Fluent\\Model\\FallbackLocale','TractorCow\\Fluent\\Model\\Locale','SilverStripe\\UserForms\\Model\\EditableFormField\\EditableOption','SilverStripe\\UserForms\\Model\\Recipient\\EmailRecipient','SilverStripe\\UserForms\\Model\\Recipient\\EmailRecipientCondition','SilverStripe\\UserForms\\Model\\Submission\\SubmittedForm','SilverStripe\\UserForms\\Model\\Submission\\SubmittedFormField','SilverStripe\\Assets\\Folder','SilverStripe\\Assets\\Image','DNADesign\\Elemental\\Models\\ElementContent','DNADesign\\ElementalUserForms\\Model\\ElementForm','DNADesign\\ElementalVirtual\\Model\\ElementVirtual','Page','App\\Models\\ElementPage','SilverStripe\\Blog\\Model\\Blog','SilverStripe\\Blog\\Model\\BlogPost','SilverStripe\\CMS\\Model\\RedirectorPage','SilverStripe\\CMS\\Model\\VirtualPage','SilverStripe\\UserForms\\Model\\UserDefinedForm','App\\Models\\EditableFormField\\EditableCheckboxTerms','SilverStripe\\UserForms\\Model\\EditableFormField\\EditableCheckbox','SilverStripe\\UserForms\\Model\\EditableFormField\\EditableCountryDropdownField','SilverStripe\\UserForms\\Model\\EditableFormField\\EditableDateField','SilverStripe\\UserForms\\Model\\EditableFormField\\EditableEmailField','SilverStripe\\UserForms\\Model\\EditableFormField\\EditableFieldGroup','SilverStripe\\UserForms\\Model\\EditableFormField\\EditableFieldGroupEnd','SilverStripe\\UserForms\\Model\\EditableFormField\\EditableFileField','SilverStripe\\UserForms\\Model\\EditableFormField\\EditableFormHeading','SilverStripe\\UserForms\\Model\\EditableFormField\\EditableFormStep','SilverStripe\\UserForms\\Model\\EditableFormField\\EditableLiteralField','SilverStripe\\UserForms\\Model\\EditableFormField\\EditableMemberListField','SilverStripe\\UserForms\\Model\\EditableFormField\\EditableMultipleOptionField','SilverStripe\\UserForms\\Model\\EditableFormField\\EditableNumericField','SilverStripe\\UserForms\\Model\\EditableFormField\\EditableTextField','SilverStripe\\UserForms\\Model\\EditableFormField\\EditableCheckboxGroupField','SilverStripe\\UserForms\\Model\\EditableFormField\\EditableDropdown','SilverStripe\\UserForms\\Model\\EditableFormField\\EditableRadioField','SilverStripe\\UserForms\\Model\\Submission\\SubmittedFileField') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'SilverStripe\\Assets\\File'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Daten für Tabelle `ChangeSetItem`
--

INSERT INTO `ChangeSetItem` (`ID`, `ClassName`, `LastEdited`, `Created`, `VersionBefore`, `VersionAfter`, `Added`, `ChangeSetID`, `ObjectID`, `ObjectClass`) VALUES
(1, 'SilverStripe\\Versioned\\ChangeSetItem', '2025-06-23 14:14:39', '2025-06-23 14:14:39', 0, 0, 'explicitly', 1, 1, 'TractorCow\\Fluent\\Model\\Locale'),
(2, 'SilverStripe\\Versioned\\ChangeSetItem', '2025-06-23 14:15:36', '2025-06-23 14:15:36', 0, 0, 'explicitly', 2, 2, 'TractorCow\\Fluent\\Model\\Locale'),
(3, 'SilverStripe\\Versioned\\ChangeSetItem', '2025-06-23 14:15:47', '2025-06-23 14:15:47', 0, 0, 'explicitly', 3, 1, 'TractorCow\\Fluent\\Model\\Locale'),
(4, 'SilverStripe\\Versioned\\ChangeSetItem', '2025-06-23 14:21:30', '2025-06-23 14:21:30', 0, 3, 'explicitly', 4, 1, 'SilverStripe\\CMS\\Model\\SiteTree'),
(5, 'SilverStripe\\Versioned\\ChangeSetItem', '2025-06-23 14:21:30', '2025-06-23 14:21:30', 0, 2, 'implicitly', 4, 1, 'DNADesign\\Elemental\\Models\\ElementalArea'),
(6, 'SilverStripe\\Versioned\\ChangeSetItem', '2025-06-23 14:21:30', '2025-06-23 14:21:30', 0, 3, 'implicitly', 4, 1, 'DNADesign\\Elemental\\Models\\BaseElement'),
(7, 'SilverStripe\\Versioned\\ChangeSetItem', '2025-06-23 14:22:02', '2025-06-23 14:22:02', 0, 5, 'explicitly', 5, 1, 'SilverStripe\\CMS\\Model\\SiteTree'),
(8, 'SilverStripe\\Versioned\\ChangeSetItem', '2025-06-23 14:22:02', '2025-06-23 14:22:02', 2, 2, 'implicitly', 5, 1, 'DNADesign\\Elemental\\Models\\ElementalArea'),
(9, 'SilverStripe\\Versioned\\ChangeSetItem', '2025-06-23 14:22:02', '2025-06-23 14:22:02', 0, 4, 'implicitly', 5, 1, 'DNADesign\\Elemental\\Models\\BaseElement'),
(10, 'SilverStripe\\Versioned\\ChangeSetItem', '2025-06-23 14:24:00', '2025-06-23 14:24:00', 4, 6, 'explicitly', 6, 1, 'DNADesign\\Elemental\\Models\\BaseElement'),
(11, 'SilverStripe\\Versioned\\ChangeSetItem', '2025-06-23 14:24:07', '2025-06-23 14:24:07', 5, 6, 'explicitly', 7, 1, 'SilverStripe\\CMS\\Model\\SiteTree'),
(12, 'SilverStripe\\Versioned\\ChangeSetItem', '2025-06-23 14:24:07', '2025-06-23 14:24:07', 2, 2, 'implicitly', 7, 1, 'DNADesign\\Elemental\\Models\\ElementalArea'),
(13, 'SilverStripe\\Versioned\\ChangeSetItem', '2025-06-23 14:24:07', '2025-06-23 14:24:07', 6, 7, 'implicitly', 7, 1, 'DNADesign\\Elemental\\Models\\BaseElement');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `ChangeSetItem_ReferencedBy`
--

CREATE TABLE `ChangeSetItem_ReferencedBy` (
  `ID` int(11) NOT NULL,
  `ChangeSetItemID` int(11) NOT NULL DEFAULT 0,
  `ChildID` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Daten für Tabelle `ChangeSetItem_ReferencedBy`
--

INSERT INTO `ChangeSetItem_ReferencedBy` (`ID`, `ChangeSetItemID`, `ChildID`) VALUES
(1, 5, 4),
(2, 6, 4),
(3, 8, 7),
(4, 9, 7),
(5, 12, 11),
(6, 13, 11);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `EditableCheckbox`
--

CREATE TABLE `EditableCheckbox` (
  `ID` int(11) NOT NULL,
  `CheckedDefault` tinyint(1) UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `EditableCheckboxTerms`
--

CREATE TABLE `EditableCheckboxTerms` (
  `ID` int(11) NOT NULL,
  `Title` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `EditableCheckboxTerms_Live`
--

CREATE TABLE `EditableCheckboxTerms_Live` (
  `ID` int(11) NOT NULL,
  `Title` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `EditableCheckboxTerms_Localised`
--

CREATE TABLE `EditableCheckboxTerms_Localised` (
  `ID` int(11) NOT NULL,
  `RecordID` int(11) NOT NULL DEFAULT 0,
  `Locale` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Title` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `EditableCheckboxTerms_Localised_Live`
--

CREATE TABLE `EditableCheckboxTerms_Localised_Live` (
  `ID` int(11) NOT NULL,
  `RecordID` int(11) NOT NULL DEFAULT 0,
  `Locale` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Title` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `EditableCheckboxTerms_Localised_Versions`
--

CREATE TABLE `EditableCheckboxTerms_Localised_Versions` (
  `Version` int(11) NOT NULL DEFAULT 0,
  `ID` int(11) NOT NULL,
  `RecordID` int(11) NOT NULL DEFAULT 0,
  `Locale` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Title` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `EditableCheckboxTerms_Versions`
--

CREATE TABLE `EditableCheckboxTerms_Versions` (
  `ID` int(11) NOT NULL,
  `RecordID` int(11) NOT NULL DEFAULT 0,
  `Version` int(11) NOT NULL DEFAULT 0,
  `Title` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `EditableCheckbox_Live`
--

CREATE TABLE `EditableCheckbox_Live` (
  `ID` int(11) NOT NULL,
  `CheckedDefault` tinyint(1) UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `EditableCheckbox_Versions`
--

CREATE TABLE `EditableCheckbox_Versions` (
  `ID` int(11) NOT NULL,
  `RecordID` int(11) NOT NULL DEFAULT 0,
  `Version` int(11) NOT NULL DEFAULT 0,
  `CheckedDefault` tinyint(1) UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `EditableCountryDropdownField`
--

CREATE TABLE `EditableCountryDropdownField` (
  `ID` int(11) NOT NULL,
  `UseEmptyString` tinyint(1) UNSIGNED NOT NULL DEFAULT 0,
  `EmptyString` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `EditableCountryDropdownField_Live`
--

CREATE TABLE `EditableCountryDropdownField_Live` (
  `ID` int(11) NOT NULL,
  `UseEmptyString` tinyint(1) UNSIGNED NOT NULL DEFAULT 0,
  `EmptyString` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `EditableCountryDropdownField_Localised`
--

CREATE TABLE `EditableCountryDropdownField_Localised` (
  `ID` int(11) NOT NULL,
  `RecordID` int(11) NOT NULL DEFAULT 0,
  `Locale` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `EmptyString` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `EditableCountryDropdownField_Localised_Live`
--

CREATE TABLE `EditableCountryDropdownField_Localised_Live` (
  `ID` int(11) NOT NULL,
  `RecordID` int(11) NOT NULL DEFAULT 0,
  `Locale` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `EmptyString` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `EditableCountryDropdownField_Localised_Versions`
--

CREATE TABLE `EditableCountryDropdownField_Localised_Versions` (
  `Version` int(11) NOT NULL DEFAULT 0,
  `ID` int(11) NOT NULL,
  `RecordID` int(11) NOT NULL DEFAULT 0,
  `Locale` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `EmptyString` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `EditableCountryDropdownField_Versions`
--

CREATE TABLE `EditableCountryDropdownField_Versions` (
  `ID` int(11) NOT NULL,
  `RecordID` int(11) NOT NULL DEFAULT 0,
  `Version` int(11) NOT NULL DEFAULT 0,
  `UseEmptyString` tinyint(1) UNSIGNED NOT NULL DEFAULT 0,
  `EmptyString` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `EditableCustomRule`
--

CREATE TABLE `EditableCustomRule` (
  `ID` int(11) NOT NULL,
  `ClassName` enum('SilverStripe\\UserForms\\Model\\EditableCustomRule') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'SilverStripe\\UserForms\\Model\\EditableCustomRule',
  `LastEdited` datetime DEFAULT NULL,
  `Created` datetime DEFAULT NULL,
  `Version` int(11) NOT NULL DEFAULT 0,
  `Display` enum('Show','Hide') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'Show',
  `ConditionOption` enum('IsBlank','IsNotBlank','HasValue','ValueNot','ValueLessThan','ValueLessThanEqual','ValueGreaterThan','ValueGreaterThanEqual') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'IsBlank',
  `FieldValue` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ParentID` int(11) NOT NULL DEFAULT 0,
  `ConditionFieldID` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `EditableCustomRule_Live`
--

CREATE TABLE `EditableCustomRule_Live` (
  `ID` int(11) NOT NULL,
  `ClassName` enum('SilverStripe\\UserForms\\Model\\EditableCustomRule') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'SilverStripe\\UserForms\\Model\\EditableCustomRule',
  `LastEdited` datetime DEFAULT NULL,
  `Created` datetime DEFAULT NULL,
  `Version` int(11) NOT NULL DEFAULT 0,
  `Display` enum('Show','Hide') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'Show',
  `ConditionOption` enum('IsBlank','IsNotBlank','HasValue','ValueNot','ValueLessThan','ValueLessThanEqual','ValueGreaterThan','ValueGreaterThanEqual') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'IsBlank',
  `FieldValue` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ParentID` int(11) NOT NULL DEFAULT 0,
  `ConditionFieldID` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `EditableCustomRule_Versions`
--

CREATE TABLE `EditableCustomRule_Versions` (
  `ID` int(11) NOT NULL,
  `RecordID` int(11) NOT NULL DEFAULT 0,
  `Version` int(11) NOT NULL DEFAULT 0,
  `WasPublished` tinyint(1) UNSIGNED NOT NULL DEFAULT 0,
  `WasDeleted` tinyint(1) UNSIGNED NOT NULL DEFAULT 0,
  `WasDraft` tinyint(1) UNSIGNED NOT NULL DEFAULT 1,
  `AuthorID` int(11) NOT NULL DEFAULT 0,
  `PublisherID` int(11) NOT NULL DEFAULT 0,
  `ClassName` enum('SilverStripe\\UserForms\\Model\\EditableCustomRule') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'SilverStripe\\UserForms\\Model\\EditableCustomRule',
  `LastEdited` datetime DEFAULT NULL,
  `Created` datetime DEFAULT NULL,
  `Display` enum('Show','Hide') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'Show',
  `ConditionOption` enum('IsBlank','IsNotBlank','HasValue','ValueNot','ValueLessThan','ValueLessThanEqual','ValueGreaterThan','ValueGreaterThanEqual') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'IsBlank',
  `FieldValue` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ParentID` int(11) NOT NULL DEFAULT 0,
  `ConditionFieldID` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `EditableDateField`
--

CREATE TABLE `EditableDateField` (
  `ID` int(11) NOT NULL,
  `DefaultToToday` tinyint(1) UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `EditableDateField_Live`
--

CREATE TABLE `EditableDateField_Live` (
  `ID` int(11) NOT NULL,
  `DefaultToToday` tinyint(1) UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `EditableDateField_Versions`
--

CREATE TABLE `EditableDateField_Versions` (
  `ID` int(11) NOT NULL,
  `RecordID` int(11) NOT NULL DEFAULT 0,
  `Version` int(11) NOT NULL DEFAULT 0,
  `DefaultToToday` tinyint(1) UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `EditableDropdown`
--

CREATE TABLE `EditableDropdown` (
  `ID` int(11) NOT NULL,
  `UseEmptyString` tinyint(1) UNSIGNED NOT NULL DEFAULT 0,
  `EmptyString` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `EditableDropdown_Live`
--

CREATE TABLE `EditableDropdown_Live` (
  `ID` int(11) NOT NULL,
  `UseEmptyString` tinyint(1) UNSIGNED NOT NULL DEFAULT 0,
  `EmptyString` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `EditableDropdown_Localised`
--

CREATE TABLE `EditableDropdown_Localised` (
  `ID` int(11) NOT NULL,
  `RecordID` int(11) NOT NULL DEFAULT 0,
  `Locale` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `EmptyString` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `EditableDropdown_Localised_Live`
--

CREATE TABLE `EditableDropdown_Localised_Live` (
  `ID` int(11) NOT NULL,
  `RecordID` int(11) NOT NULL DEFAULT 0,
  `Locale` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `EmptyString` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `EditableDropdown_Localised_Versions`
--

CREATE TABLE `EditableDropdown_Localised_Versions` (
  `Version` int(11) NOT NULL DEFAULT 0,
  `ID` int(11) NOT NULL,
  `RecordID` int(11) NOT NULL DEFAULT 0,
  `Locale` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `EmptyString` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `EditableDropdown_Versions`
--

CREATE TABLE `EditableDropdown_Versions` (
  `ID` int(11) NOT NULL,
  `RecordID` int(11) NOT NULL DEFAULT 0,
  `Version` int(11) NOT NULL DEFAULT 0,
  `UseEmptyString` tinyint(1) UNSIGNED NOT NULL DEFAULT 0,
  `EmptyString` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `EditableFieldGroup`
--

CREATE TABLE `EditableFieldGroup` (
  `ID` int(11) NOT NULL,
  `EndID` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `EditableFieldGroup_Live`
--

CREATE TABLE `EditableFieldGroup_Live` (
  `ID` int(11) NOT NULL,
  `EndID` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `EditableFieldGroup_Versions`
--

CREATE TABLE `EditableFieldGroup_Versions` (
  `ID` int(11) NOT NULL,
  `RecordID` int(11) NOT NULL DEFAULT 0,
  `Version` int(11) NOT NULL DEFAULT 0,
  `EndID` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `EditableFileField`
--

CREATE TABLE `EditableFileField` (
  `ID` int(11) NOT NULL,
  `MaxFileSizeMB` float NOT NULL DEFAULT 0,
  `FolderConfirmed` tinyint(1) UNSIGNED NOT NULL DEFAULT 0,
  `FolderID` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `EditableFileField_Live`
--

CREATE TABLE `EditableFileField_Live` (
  `ID` int(11) NOT NULL,
  `MaxFileSizeMB` float NOT NULL DEFAULT 0,
  `FolderConfirmed` tinyint(1) UNSIGNED NOT NULL DEFAULT 0,
  `FolderID` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `EditableFileField_Versions`
--

CREATE TABLE `EditableFileField_Versions` (
  `ID` int(11) NOT NULL,
  `RecordID` int(11) NOT NULL DEFAULT 0,
  `Version` int(11) NOT NULL DEFAULT 0,
  `MaxFileSizeMB` float NOT NULL DEFAULT 0,
  `FolderConfirmed` tinyint(1) UNSIGNED NOT NULL DEFAULT 0,
  `FolderID` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `EditableFormField`
--

CREATE TABLE `EditableFormField` (
  `ID` int(11) NOT NULL,
  `ClassName` enum('SilverStripe\\UserForms\\Model\\EditableFormField','App\\Models\\EditableFormField\\EditableCheckboxTerms','SilverStripe\\UserForms\\Model\\EditableFormField\\EditableCheckbox','SilverStripe\\UserForms\\Model\\EditableFormField\\EditableCountryDropdownField','SilverStripe\\UserForms\\Model\\EditableFormField\\EditableDateField','SilverStripe\\UserForms\\Model\\EditableFormField\\EditableEmailField','SilverStripe\\UserForms\\Model\\EditableFormField\\EditableFieldGroup','SilverStripe\\UserForms\\Model\\EditableFormField\\EditableFieldGroupEnd','SilverStripe\\UserForms\\Model\\EditableFormField\\EditableFileField','SilverStripe\\UserForms\\Model\\EditableFormField\\EditableFormHeading','SilverStripe\\UserForms\\Model\\EditableFormField\\EditableFormStep','SilverStripe\\UserForms\\Model\\EditableFormField\\EditableLiteralField','SilverStripe\\UserForms\\Model\\EditableFormField\\EditableMemberListField','SilverStripe\\UserForms\\Model\\EditableFormField\\EditableMultipleOptionField','SilverStripe\\UserForms\\Model\\EditableFormField\\EditableNumericField','SilverStripe\\UserForms\\Model\\EditableFormField\\EditableTextField','SilverStripe\\UserForms\\Model\\EditableFormField\\EditableCheckboxGroupField','SilverStripe\\UserForms\\Model\\EditableFormField\\EditableDropdown','SilverStripe\\UserForms\\Model\\EditableFormField\\EditableRadioField') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'SilverStripe\\UserForms\\Model\\EditableFormField',
  `LastEdited` datetime DEFAULT NULL,
  `Created` datetime DEFAULT NULL,
  `Version` int(11) NOT NULL DEFAULT 0,
  `Name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Default` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Sort` int(11) NOT NULL DEFAULT 0,
  `Required` tinyint(1) UNSIGNED NOT NULL DEFAULT 0,
  `CustomErrorMessage` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ExtraClass` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `RightTitle` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ShowOnLoad` tinyint(1) UNSIGNED NOT NULL DEFAULT 1,
  `ShowInSummary` tinyint(1) UNSIGNED NOT NULL DEFAULT 0,
  `Placeholder` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `DisplayRulesConjunction` enum('And','Or') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'Or',
  `ParentID` int(11) NOT NULL DEFAULT 0,
  `ParentClass` enum('SilverStripe\\Assets\\File','SilverStripe\\SiteConfig\\SiteConfig','SilverStripe\\Versioned\\ChangeSet','SilverStripe\\Versioned\\ChangeSetItem','DNADesign\\Elemental\\Models\\BaseElement','DNADesign\\Elemental\\Models\\ElementalArea','SilverStripe\\Assets\\Shortcodes\\FileLink','SilverStripe\\Blog\\Model\\BlogCategory','SilverStripe\\Blog\\Model\\BlogTag','SilverStripe\\CMS\\Model\\SiteTree','SilverStripe\\CMS\\Model\\SiteTreeLink','SilverStripe\\Security\\Group','SilverStripe\\Security\\LoginAttempt','SilverStripe\\Security\\Member','SilverStripe\\Security\\MemberPassword','SilverStripe\\Security\\Permission','SilverStripe\\Security\\PermissionRole','SilverStripe\\Security\\PermissionRoleCode','SilverStripe\\Security\\RememberLoginHash','SilverStripe\\UserForms\\Model\\EditableCustomRule','SilverStripe\\UserForms\\Model\\EditableFormField','TractorCow\\Fluent\\Model\\Domain','TractorCow\\Fluent\\Model\\FallbackLocale','TractorCow\\Fluent\\Model\\Locale','SilverStripe\\UserForms\\Model\\EditableFormField\\EditableOption','SilverStripe\\UserForms\\Model\\Recipient\\EmailRecipient','SilverStripe\\UserForms\\Model\\Recipient\\EmailRecipientCondition','SilverStripe\\UserForms\\Model\\Submission\\SubmittedForm','SilverStripe\\UserForms\\Model\\Submission\\SubmittedFormField','SilverStripe\\Assets\\Folder','SilverStripe\\Assets\\Image','DNADesign\\Elemental\\Models\\ElementContent','DNADesign\\ElementalUserForms\\Model\\ElementForm','DNADesign\\ElementalVirtual\\Model\\ElementVirtual','Page','App\\Models\\ElementPage','SilverStripe\\Blog\\Model\\Blog','SilverStripe\\Blog\\Model\\BlogPost','SilverStripe\\CMS\\Model\\RedirectorPage','SilverStripe\\CMS\\Model\\VirtualPage','SilverStripe\\UserForms\\Model\\UserDefinedForm','App\\Models\\EditableFormField\\EditableCheckboxTerms','SilverStripe\\UserForms\\Model\\EditableFormField\\EditableCheckbox','SilverStripe\\UserForms\\Model\\EditableFormField\\EditableCountryDropdownField','SilverStripe\\UserForms\\Model\\EditableFormField\\EditableDateField','SilverStripe\\UserForms\\Model\\EditableFormField\\EditableEmailField','SilverStripe\\UserForms\\Model\\EditableFormField\\EditableFieldGroup','SilverStripe\\UserForms\\Model\\EditableFormField\\EditableFieldGroupEnd','SilverStripe\\UserForms\\Model\\EditableFormField\\EditableFileField','SilverStripe\\UserForms\\Model\\EditableFormField\\EditableFormHeading','SilverStripe\\UserForms\\Model\\EditableFormField\\EditableFormStep','SilverStripe\\UserForms\\Model\\EditableFormField\\EditableLiteralField','SilverStripe\\UserForms\\Model\\EditableFormField\\EditableMemberListField','SilverStripe\\UserForms\\Model\\EditableFormField\\EditableMultipleOptionField','SilverStripe\\UserForms\\Model\\EditableFormField\\EditableNumericField','SilverStripe\\UserForms\\Model\\EditableFormField\\EditableTextField','SilverStripe\\UserForms\\Model\\EditableFormField\\EditableCheckboxGroupField','SilverStripe\\UserForms\\Model\\EditableFormField\\EditableDropdown','SilverStripe\\UserForms\\Model\\EditableFormField\\EditableRadioField','SilverStripe\\UserForms\\Model\\Submission\\SubmittedFileField') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'SilverStripe\\Assets\\File'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `EditableFormField_Live`
--

CREATE TABLE `EditableFormField_Live` (
  `ID` int(11) NOT NULL,
  `ClassName` enum('SilverStripe\\UserForms\\Model\\EditableFormField','App\\Models\\EditableFormField\\EditableCheckboxTerms','SilverStripe\\UserForms\\Model\\EditableFormField\\EditableCheckbox','SilverStripe\\UserForms\\Model\\EditableFormField\\EditableCountryDropdownField','SilverStripe\\UserForms\\Model\\EditableFormField\\EditableDateField','SilverStripe\\UserForms\\Model\\EditableFormField\\EditableEmailField','SilverStripe\\UserForms\\Model\\EditableFormField\\EditableFieldGroup','SilverStripe\\UserForms\\Model\\EditableFormField\\EditableFieldGroupEnd','SilverStripe\\UserForms\\Model\\EditableFormField\\EditableFileField','SilverStripe\\UserForms\\Model\\EditableFormField\\EditableFormHeading','SilverStripe\\UserForms\\Model\\EditableFormField\\EditableFormStep','SilverStripe\\UserForms\\Model\\EditableFormField\\EditableLiteralField','SilverStripe\\UserForms\\Model\\EditableFormField\\EditableMemberListField','SilverStripe\\UserForms\\Model\\EditableFormField\\EditableMultipleOptionField','SilverStripe\\UserForms\\Model\\EditableFormField\\EditableNumericField','SilverStripe\\UserForms\\Model\\EditableFormField\\EditableTextField','SilverStripe\\UserForms\\Model\\EditableFormField\\EditableCheckboxGroupField','SilverStripe\\UserForms\\Model\\EditableFormField\\EditableDropdown','SilverStripe\\UserForms\\Model\\EditableFormField\\EditableRadioField') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'SilverStripe\\UserForms\\Model\\EditableFormField',
  `LastEdited` datetime DEFAULT NULL,
  `Created` datetime DEFAULT NULL,
  `Version` int(11) NOT NULL DEFAULT 0,
  `Name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Default` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Sort` int(11) NOT NULL DEFAULT 0,
  `Required` tinyint(1) UNSIGNED NOT NULL DEFAULT 0,
  `CustomErrorMessage` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ExtraClass` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `RightTitle` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ShowOnLoad` tinyint(1) UNSIGNED NOT NULL DEFAULT 1,
  `ShowInSummary` tinyint(1) UNSIGNED NOT NULL DEFAULT 0,
  `Placeholder` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `DisplayRulesConjunction` enum('And','Or') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'Or',
  `ParentID` int(11) NOT NULL DEFAULT 0,
  `ParentClass` enum('SilverStripe\\Assets\\File','SilverStripe\\SiteConfig\\SiteConfig','SilverStripe\\Versioned\\ChangeSet','SilverStripe\\Versioned\\ChangeSetItem','DNADesign\\Elemental\\Models\\BaseElement','DNADesign\\Elemental\\Models\\ElementalArea','SilverStripe\\Assets\\Shortcodes\\FileLink','SilverStripe\\Blog\\Model\\BlogCategory','SilverStripe\\Blog\\Model\\BlogTag','SilverStripe\\CMS\\Model\\SiteTree','SilverStripe\\CMS\\Model\\SiteTreeLink','SilverStripe\\Security\\Group','SilverStripe\\Security\\LoginAttempt','SilverStripe\\Security\\Member','SilverStripe\\Security\\MemberPassword','SilverStripe\\Security\\Permission','SilverStripe\\Security\\PermissionRole','SilverStripe\\Security\\PermissionRoleCode','SilverStripe\\Security\\RememberLoginHash','SilverStripe\\UserForms\\Model\\EditableCustomRule','SilverStripe\\UserForms\\Model\\EditableFormField','TractorCow\\Fluent\\Model\\Domain','TractorCow\\Fluent\\Model\\FallbackLocale','TractorCow\\Fluent\\Model\\Locale','SilverStripe\\UserForms\\Model\\EditableFormField\\EditableOption','SilverStripe\\UserForms\\Model\\Recipient\\EmailRecipient','SilverStripe\\UserForms\\Model\\Recipient\\EmailRecipientCondition','SilverStripe\\UserForms\\Model\\Submission\\SubmittedForm','SilverStripe\\UserForms\\Model\\Submission\\SubmittedFormField','SilverStripe\\Assets\\Folder','SilverStripe\\Assets\\Image','DNADesign\\Elemental\\Models\\ElementContent','DNADesign\\ElementalUserForms\\Model\\ElementForm','DNADesign\\ElementalVirtual\\Model\\ElementVirtual','Page','App\\Models\\ElementPage','SilverStripe\\Blog\\Model\\Blog','SilverStripe\\Blog\\Model\\BlogPost','SilverStripe\\CMS\\Model\\RedirectorPage','SilverStripe\\CMS\\Model\\VirtualPage','SilverStripe\\UserForms\\Model\\UserDefinedForm','App\\Models\\EditableFormField\\EditableCheckboxTerms','SilverStripe\\UserForms\\Model\\EditableFormField\\EditableCheckbox','SilverStripe\\UserForms\\Model\\EditableFormField\\EditableCountryDropdownField','SilverStripe\\UserForms\\Model\\EditableFormField\\EditableDateField','SilverStripe\\UserForms\\Model\\EditableFormField\\EditableEmailField','SilverStripe\\UserForms\\Model\\EditableFormField\\EditableFieldGroup','SilverStripe\\UserForms\\Model\\EditableFormField\\EditableFieldGroupEnd','SilverStripe\\UserForms\\Model\\EditableFormField\\EditableFileField','SilverStripe\\UserForms\\Model\\EditableFormField\\EditableFormHeading','SilverStripe\\UserForms\\Model\\EditableFormField\\EditableFormStep','SilverStripe\\UserForms\\Model\\EditableFormField\\EditableLiteralField','SilverStripe\\UserForms\\Model\\EditableFormField\\EditableMemberListField','SilverStripe\\UserForms\\Model\\EditableFormField\\EditableMultipleOptionField','SilverStripe\\UserForms\\Model\\EditableFormField\\EditableNumericField','SilverStripe\\UserForms\\Model\\EditableFormField\\EditableTextField','SilverStripe\\UserForms\\Model\\EditableFormField\\EditableCheckboxGroupField','SilverStripe\\UserForms\\Model\\EditableFormField\\EditableDropdown','SilverStripe\\UserForms\\Model\\EditableFormField\\EditableRadioField','SilverStripe\\UserForms\\Model\\Submission\\SubmittedFileField') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'SilverStripe\\Assets\\File'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `EditableFormField_Localised`
--

CREATE TABLE `EditableFormField_Localised` (
  `ID` int(11) NOT NULL,
  `RecordID` int(11) NOT NULL DEFAULT 0,
  `Locale` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Default` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CustomErrorMessage` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ExtraClass` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `RightTitle` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Placeholder` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `EditableFormField_Localised_Live`
--

CREATE TABLE `EditableFormField_Localised_Live` (
  `ID` int(11) NOT NULL,
  `RecordID` int(11) NOT NULL DEFAULT 0,
  `Locale` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Default` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CustomErrorMessage` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ExtraClass` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `RightTitle` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Placeholder` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `EditableFormField_Localised_Versions`
--

CREATE TABLE `EditableFormField_Localised_Versions` (
  `Version` int(11) NOT NULL DEFAULT 0,
  `ID` int(11) NOT NULL,
  `RecordID` int(11) NOT NULL DEFAULT 0,
  `Locale` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Default` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CustomErrorMessage` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ExtraClass` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `RightTitle` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Placeholder` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `EditableFormField_Versions`
--

CREATE TABLE `EditableFormField_Versions` (
  `ID` int(11) NOT NULL,
  `RecordID` int(11) NOT NULL DEFAULT 0,
  `Version` int(11) NOT NULL DEFAULT 0,
  `WasPublished` tinyint(1) UNSIGNED NOT NULL DEFAULT 0,
  `WasDeleted` tinyint(1) UNSIGNED NOT NULL DEFAULT 0,
  `WasDraft` tinyint(1) UNSIGNED NOT NULL DEFAULT 1,
  `AuthorID` int(11) NOT NULL DEFAULT 0,
  `PublisherID` int(11) NOT NULL DEFAULT 0,
  `ClassName` enum('SilverStripe\\UserForms\\Model\\EditableFormField','App\\Models\\EditableFormField\\EditableCheckboxTerms','SilverStripe\\UserForms\\Model\\EditableFormField\\EditableCheckbox','SilverStripe\\UserForms\\Model\\EditableFormField\\EditableCountryDropdownField','SilverStripe\\UserForms\\Model\\EditableFormField\\EditableDateField','SilverStripe\\UserForms\\Model\\EditableFormField\\EditableEmailField','SilverStripe\\UserForms\\Model\\EditableFormField\\EditableFieldGroup','SilverStripe\\UserForms\\Model\\EditableFormField\\EditableFieldGroupEnd','SilverStripe\\UserForms\\Model\\EditableFormField\\EditableFileField','SilverStripe\\UserForms\\Model\\EditableFormField\\EditableFormHeading','SilverStripe\\UserForms\\Model\\EditableFormField\\EditableFormStep','SilverStripe\\UserForms\\Model\\EditableFormField\\EditableLiteralField','SilverStripe\\UserForms\\Model\\EditableFormField\\EditableMemberListField','SilverStripe\\UserForms\\Model\\EditableFormField\\EditableMultipleOptionField','SilverStripe\\UserForms\\Model\\EditableFormField\\EditableNumericField','SilverStripe\\UserForms\\Model\\EditableFormField\\EditableTextField','SilverStripe\\UserForms\\Model\\EditableFormField\\EditableCheckboxGroupField','SilverStripe\\UserForms\\Model\\EditableFormField\\EditableDropdown','SilverStripe\\UserForms\\Model\\EditableFormField\\EditableRadioField') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'SilverStripe\\UserForms\\Model\\EditableFormField',
  `LastEdited` datetime DEFAULT NULL,
  `Created` datetime DEFAULT NULL,
  `Name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Default` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Sort` int(11) NOT NULL DEFAULT 0,
  `Required` tinyint(1) UNSIGNED NOT NULL DEFAULT 0,
  `CustomErrorMessage` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ExtraClass` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `RightTitle` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ShowOnLoad` tinyint(1) UNSIGNED NOT NULL DEFAULT 1,
  `ShowInSummary` tinyint(1) UNSIGNED NOT NULL DEFAULT 0,
  `Placeholder` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `DisplayRulesConjunction` enum('And','Or') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'Or',
  `ParentID` int(11) NOT NULL DEFAULT 0,
  `ParentClass` enum('SilverStripe\\Assets\\File','SilverStripe\\SiteConfig\\SiteConfig','SilverStripe\\Versioned\\ChangeSet','SilverStripe\\Versioned\\ChangeSetItem','DNADesign\\Elemental\\Models\\BaseElement','DNADesign\\Elemental\\Models\\ElementalArea','SilverStripe\\Assets\\Shortcodes\\FileLink','SilverStripe\\Blog\\Model\\BlogCategory','SilverStripe\\Blog\\Model\\BlogTag','SilverStripe\\CMS\\Model\\SiteTree','SilverStripe\\CMS\\Model\\SiteTreeLink','SilverStripe\\Security\\Group','SilverStripe\\Security\\LoginAttempt','SilverStripe\\Security\\Member','SilverStripe\\Security\\MemberPassword','SilverStripe\\Security\\Permission','SilverStripe\\Security\\PermissionRole','SilverStripe\\Security\\PermissionRoleCode','SilverStripe\\Security\\RememberLoginHash','SilverStripe\\UserForms\\Model\\EditableCustomRule','SilverStripe\\UserForms\\Model\\EditableFormField','TractorCow\\Fluent\\Model\\Domain','TractorCow\\Fluent\\Model\\FallbackLocale','TractorCow\\Fluent\\Model\\Locale','SilverStripe\\UserForms\\Model\\EditableFormField\\EditableOption','SilverStripe\\UserForms\\Model\\Recipient\\EmailRecipient','SilverStripe\\UserForms\\Model\\Recipient\\EmailRecipientCondition','SilverStripe\\UserForms\\Model\\Submission\\SubmittedForm','SilverStripe\\UserForms\\Model\\Submission\\SubmittedFormField','SilverStripe\\Assets\\Folder','SilverStripe\\Assets\\Image','DNADesign\\Elemental\\Models\\ElementContent','DNADesign\\ElementalUserForms\\Model\\ElementForm','DNADesign\\ElementalVirtual\\Model\\ElementVirtual','Page','App\\Models\\ElementPage','SilverStripe\\Blog\\Model\\Blog','SilverStripe\\Blog\\Model\\BlogPost','SilverStripe\\CMS\\Model\\RedirectorPage','SilverStripe\\CMS\\Model\\VirtualPage','SilverStripe\\UserForms\\Model\\UserDefinedForm','App\\Models\\EditableFormField\\EditableCheckboxTerms','SilverStripe\\UserForms\\Model\\EditableFormField\\EditableCheckbox','SilverStripe\\UserForms\\Model\\EditableFormField\\EditableCountryDropdownField','SilverStripe\\UserForms\\Model\\EditableFormField\\EditableDateField','SilverStripe\\UserForms\\Model\\EditableFormField\\EditableEmailField','SilverStripe\\UserForms\\Model\\EditableFormField\\EditableFieldGroup','SilverStripe\\UserForms\\Model\\EditableFormField\\EditableFieldGroupEnd','SilverStripe\\UserForms\\Model\\EditableFormField\\EditableFileField','SilverStripe\\UserForms\\Model\\EditableFormField\\EditableFormHeading','SilverStripe\\UserForms\\Model\\EditableFormField\\EditableFormStep','SilverStripe\\UserForms\\Model\\EditableFormField\\EditableLiteralField','SilverStripe\\UserForms\\Model\\EditableFormField\\EditableMemberListField','SilverStripe\\UserForms\\Model\\EditableFormField\\EditableMultipleOptionField','SilverStripe\\UserForms\\Model\\EditableFormField\\EditableNumericField','SilverStripe\\UserForms\\Model\\EditableFormField\\EditableTextField','SilverStripe\\UserForms\\Model\\EditableFormField\\EditableCheckboxGroupField','SilverStripe\\UserForms\\Model\\EditableFormField\\EditableDropdown','SilverStripe\\UserForms\\Model\\EditableFormField\\EditableRadioField','SilverStripe\\UserForms\\Model\\Submission\\SubmittedFileField') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'SilverStripe\\Assets\\File'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `EditableFormHeading`
--

CREATE TABLE `EditableFormHeading` (
  `ID` int(11) NOT NULL,
  `Level` int(11) NOT NULL DEFAULT 3,
  `HideFromReports` tinyint(1) UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `EditableFormHeading_Live`
--

CREATE TABLE `EditableFormHeading_Live` (
  `ID` int(11) NOT NULL,
  `Level` int(11) NOT NULL DEFAULT 3,
  `HideFromReports` tinyint(1) UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `EditableFormHeading_Versions`
--

CREATE TABLE `EditableFormHeading_Versions` (
  `ID` int(11) NOT NULL,
  `RecordID` int(11) NOT NULL DEFAULT 0,
  `Version` int(11) NOT NULL DEFAULT 0,
  `Level` int(11) NOT NULL DEFAULT 3,
  `HideFromReports` tinyint(1) UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `EditableLiteralField`
--

CREATE TABLE `EditableLiteralField` (
  `ID` int(11) NOT NULL,
  `Content` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `HideFromReports` tinyint(1) UNSIGNED NOT NULL DEFAULT 0,
  `HideLabel` tinyint(1) UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `EditableLiteralField_Live`
--

CREATE TABLE `EditableLiteralField_Live` (
  `ID` int(11) NOT NULL,
  `Content` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `HideFromReports` tinyint(1) UNSIGNED NOT NULL DEFAULT 0,
  `HideLabel` tinyint(1) UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `EditableLiteralField_Localised`
--

CREATE TABLE `EditableLiteralField_Localised` (
  `ID` int(11) NOT NULL,
  `RecordID` int(11) NOT NULL DEFAULT 0,
  `Locale` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Content` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `EditableLiteralField_Localised_Live`
--

CREATE TABLE `EditableLiteralField_Localised_Live` (
  `ID` int(11) NOT NULL,
  `RecordID` int(11) NOT NULL DEFAULT 0,
  `Locale` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Content` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `EditableLiteralField_Localised_Versions`
--

CREATE TABLE `EditableLiteralField_Localised_Versions` (
  `Version` int(11) NOT NULL DEFAULT 0,
  `ID` int(11) NOT NULL,
  `RecordID` int(11) NOT NULL DEFAULT 0,
  `Locale` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Content` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `EditableLiteralField_Versions`
--

CREATE TABLE `EditableLiteralField_Versions` (
  `ID` int(11) NOT NULL,
  `RecordID` int(11) NOT NULL DEFAULT 0,
  `Version` int(11) NOT NULL DEFAULT 0,
  `Content` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `HideFromReports` tinyint(1) UNSIGNED NOT NULL DEFAULT 0,
  `HideLabel` tinyint(1) UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `EditableMemberListField`
--

CREATE TABLE `EditableMemberListField` (
  `ID` int(11) NOT NULL,
  `GroupID` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `EditableMemberListField_Live`
--

CREATE TABLE `EditableMemberListField_Live` (
  `ID` int(11) NOT NULL,
  `GroupID` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `EditableMemberListField_Versions`
--

CREATE TABLE `EditableMemberListField_Versions` (
  `ID` int(11) NOT NULL,
  `RecordID` int(11) NOT NULL DEFAULT 0,
  `Version` int(11) NOT NULL DEFAULT 0,
  `GroupID` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `EditableNumericField`
--

CREATE TABLE `EditableNumericField` (
  `ID` int(11) NOT NULL,
  `MinValue` int(11) NOT NULL DEFAULT 0,
  `MaxValue` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `EditableNumericField_Live`
--

CREATE TABLE `EditableNumericField_Live` (
  `ID` int(11) NOT NULL,
  `MinValue` int(11) NOT NULL DEFAULT 0,
  `MaxValue` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `EditableNumericField_Versions`
--

CREATE TABLE `EditableNumericField_Versions` (
  `ID` int(11) NOT NULL,
  `RecordID` int(11) NOT NULL DEFAULT 0,
  `Version` int(11) NOT NULL DEFAULT 0,
  `MinValue` int(11) NOT NULL DEFAULT 0,
  `MaxValue` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `EditableOption`
--

CREATE TABLE `EditableOption` (
  `ID` int(11) NOT NULL,
  `ClassName` enum('SilverStripe\\UserForms\\Model\\EditableFormField\\EditableOption') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'SilverStripe\\UserForms\\Model\\EditableFormField\\EditableOption',
  `LastEdited` datetime DEFAULT NULL,
  `Created` datetime DEFAULT NULL,
  `Version` int(11) NOT NULL DEFAULT 0,
  `Name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Default` tinyint(1) UNSIGNED NOT NULL DEFAULT 0,
  `Sort` int(11) NOT NULL DEFAULT 0,
  `Value` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ParentID` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `EditableOption_Live`
--

CREATE TABLE `EditableOption_Live` (
  `ID` int(11) NOT NULL,
  `ClassName` enum('SilverStripe\\UserForms\\Model\\EditableFormField\\EditableOption') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'SilverStripe\\UserForms\\Model\\EditableFormField\\EditableOption',
  `LastEdited` datetime DEFAULT NULL,
  `Created` datetime DEFAULT NULL,
  `Version` int(11) NOT NULL DEFAULT 0,
  `Name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Default` tinyint(1) UNSIGNED NOT NULL DEFAULT 0,
  `Sort` int(11) NOT NULL DEFAULT 0,
  `Value` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ParentID` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `EditableOption_Localised`
--

CREATE TABLE `EditableOption_Localised` (
  `ID` int(11) NOT NULL,
  `RecordID` int(11) NOT NULL DEFAULT 0,
  `Locale` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Value` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `EditableOption_Localised_Live`
--

CREATE TABLE `EditableOption_Localised_Live` (
  `ID` int(11) NOT NULL,
  `RecordID` int(11) NOT NULL DEFAULT 0,
  `Locale` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Value` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `EditableOption_Localised_Versions`
--

CREATE TABLE `EditableOption_Localised_Versions` (
  `Version` int(11) NOT NULL DEFAULT 0,
  `ID` int(11) NOT NULL,
  `RecordID` int(11) NOT NULL DEFAULT 0,
  `Locale` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Value` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `EditableOption_Versions`
--

CREATE TABLE `EditableOption_Versions` (
  `ID` int(11) NOT NULL,
  `RecordID` int(11) NOT NULL DEFAULT 0,
  `Version` int(11) NOT NULL DEFAULT 0,
  `WasPublished` tinyint(1) UNSIGNED NOT NULL DEFAULT 0,
  `WasDeleted` tinyint(1) UNSIGNED NOT NULL DEFAULT 0,
  `WasDraft` tinyint(1) UNSIGNED NOT NULL DEFAULT 1,
  `AuthorID` int(11) NOT NULL DEFAULT 0,
  `PublisherID` int(11) NOT NULL DEFAULT 0,
  `ClassName` enum('SilverStripe\\UserForms\\Model\\EditableFormField\\EditableOption') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'SilverStripe\\UserForms\\Model\\EditableFormField\\EditableOption',
  `LastEdited` datetime DEFAULT NULL,
  `Created` datetime DEFAULT NULL,
  `Name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Default` tinyint(1) UNSIGNED NOT NULL DEFAULT 0,
  `Sort` int(11) NOT NULL DEFAULT 0,
  `Value` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ParentID` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `EditableTextField`
--

CREATE TABLE `EditableTextField` (
  `ID` int(11) NOT NULL,
  `MinLength` int(11) NOT NULL DEFAULT 0,
  `MaxLength` int(11) NOT NULL DEFAULT 0,
  `Rows` int(11) NOT NULL DEFAULT 1,
  `Autocomplete` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `EditableTextField_Live`
--

CREATE TABLE `EditableTextField_Live` (
  `ID` int(11) NOT NULL,
  `MinLength` int(11) NOT NULL DEFAULT 0,
  `MaxLength` int(11) NOT NULL DEFAULT 0,
  `Rows` int(11) NOT NULL DEFAULT 1,
  `Autocomplete` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `EditableTextField_Localised`
--

CREATE TABLE `EditableTextField_Localised` (
  `ID` int(11) NOT NULL,
  `RecordID` int(11) NOT NULL DEFAULT 0,
  `Locale` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Autocomplete` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `EditableTextField_Localised_Live`
--

CREATE TABLE `EditableTextField_Localised_Live` (
  `ID` int(11) NOT NULL,
  `RecordID` int(11) NOT NULL DEFAULT 0,
  `Locale` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Autocomplete` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `EditableTextField_Localised_Versions`
--

CREATE TABLE `EditableTextField_Localised_Versions` (
  `Version` int(11) NOT NULL DEFAULT 0,
  `ID` int(11) NOT NULL,
  `RecordID` int(11) NOT NULL DEFAULT 0,
  `Locale` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Autocomplete` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `EditableTextField_Versions`
--

CREATE TABLE `EditableTextField_Versions` (
  `ID` int(11) NOT NULL,
  `RecordID` int(11) NOT NULL DEFAULT 0,
  `Version` int(11) NOT NULL DEFAULT 0,
  `MinLength` int(11) NOT NULL DEFAULT 0,
  `MaxLength` int(11) NOT NULL DEFAULT 0,
  `Rows` int(11) NOT NULL DEFAULT 1,
  `Autocomplete` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `Element`
--

CREATE TABLE `Element` (
  `ID` int(11) NOT NULL,
  `ClassName` enum('DNADesign\\Elemental\\Models\\BaseElement','DNADesign\\Elemental\\Models\\ElementContent','DNADesign\\ElementalUserForms\\Model\\ElementForm','DNADesign\\ElementalVirtual\\Model\\ElementVirtual') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'DNADesign\\Elemental\\Models\\BaseElement',
  `LastEdited` datetime DEFAULT NULL,
  `Created` datetime DEFAULT NULL,
  `AvailableGlobally` tinyint(1) UNSIGNED NOT NULL DEFAULT 1,
  `VirtualLookupTitle` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Version` int(11) NOT NULL DEFAULT 0,
  `Title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ShowTitle` tinyint(1) UNSIGNED NOT NULL DEFAULT 0,
  `Sort` int(11) NOT NULL DEFAULT 0,
  `ExtraClass` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Style` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `TopPageID` int(11) NOT NULL DEFAULT 0,
  `ParentID` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Daten für Tabelle `Element`
--

INSERT INTO `Element` (`ID`, `ClassName`, `LastEdited`, `Created`, `AvailableGlobally`, `VirtualLookupTitle`, `Version`, `Title`, `ShowTitle`, `Sort`, `ExtraClass`, `Style`, `TopPageID`, `ParentID`) VALUES
(1, 'DNADesign\\Elemental\\Models\\ElementContent', '2025-06-23 14:24:07', '2025-06-23 14:16:16', 1, 'The sun painted gentle patterns (Text #1)', 7, 'The sun painted gentle patterns', 1, 1, NULL, NULL, 1, 1);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `ElementalArea`
--

CREATE TABLE `ElementalArea` (
  `ID` int(11) NOT NULL,
  `ClassName` enum('DNADesign\\Elemental\\Models\\ElementalArea') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'DNADesign\\Elemental\\Models\\ElementalArea',
  `LastEdited` datetime DEFAULT NULL,
  `Created` datetime DEFAULT NULL,
  `Version` int(11) NOT NULL DEFAULT 0,
  `OwnerClassName` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `TopPageID` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Daten für Tabelle `ElementalArea`
--

INSERT INTO `ElementalArea` (`ID`, `ClassName`, `LastEdited`, `Created`, `Version`, `OwnerClassName`, `TopPageID`) VALUES
(1, 'DNADesign\\Elemental\\Models\\ElementalArea', '2025-06-23 14:21:30', '2025-06-23 14:15:56', 2, 'App\\Models\\ElementPage', 1),
(2, 'DNADesign\\Elemental\\Models\\ElementalArea', '2025-06-23 14:21:30', '2025-06-23 14:21:30', 1, 'App\\Models\\ElementPage', 1);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `ElementalArea_Live`
--

CREATE TABLE `ElementalArea_Live` (
  `ID` int(11) NOT NULL,
  `ClassName` enum('DNADesign\\Elemental\\Models\\ElementalArea') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'DNADesign\\Elemental\\Models\\ElementalArea',
  `LastEdited` datetime DEFAULT NULL,
  `Created` datetime DEFAULT NULL,
  `Version` int(11) NOT NULL DEFAULT 0,
  `OwnerClassName` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `TopPageID` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Daten für Tabelle `ElementalArea_Live`
--

INSERT INTO `ElementalArea_Live` (`ID`, `ClassName`, `LastEdited`, `Created`, `Version`, `OwnerClassName`, `TopPageID`) VALUES
(1, 'DNADesign\\Elemental\\Models\\ElementalArea', '2025-06-23 14:21:30', '2025-06-23 14:15:56', 2, 'App\\Models\\ElementPage', 1),
(2, 'DNADesign\\Elemental\\Models\\ElementalArea', '2025-06-23 14:21:30', '2025-06-23 14:21:30', 1, 'App\\Models\\ElementPage', 0);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `ElementalArea_Versions`
--

CREATE TABLE `ElementalArea_Versions` (
  `ID` int(11) NOT NULL,
  `RecordID` int(11) NOT NULL DEFAULT 0,
  `Version` int(11) NOT NULL DEFAULT 0,
  `WasPublished` tinyint(1) UNSIGNED NOT NULL DEFAULT 0,
  `WasDeleted` tinyint(1) UNSIGNED NOT NULL DEFAULT 0,
  `WasDraft` tinyint(1) UNSIGNED NOT NULL DEFAULT 1,
  `AuthorID` int(11) NOT NULL DEFAULT 0,
  `PublisherID` int(11) NOT NULL DEFAULT 0,
  `ClassName` enum('DNADesign\\Elemental\\Models\\ElementalArea') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'DNADesign\\Elemental\\Models\\ElementalArea',
  `LastEdited` datetime DEFAULT NULL,
  `Created` datetime DEFAULT NULL,
  `OwnerClassName` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `TopPageID` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Daten für Tabelle `ElementalArea_Versions`
--

INSERT INTO `ElementalArea_Versions` (`ID`, `RecordID`, `Version`, `WasPublished`, `WasDeleted`, `WasDraft`, `AuthorID`, `PublisherID`, `ClassName`, `LastEdited`, `Created`, `OwnerClassName`, `TopPageID`) VALUES
(1, 1, 1, 0, 0, 1, 1, 0, 'DNADesign\\Elemental\\Models\\ElementalArea', '2025-06-23 14:15:56', '2025-06-23 14:15:56', 'App\\Models\\ElementPage', 0),
(2, 2, 1, 1, 0, 1, 1, 1, 'DNADesign\\Elemental\\Models\\ElementalArea', '2025-06-23 14:21:30', '2025-06-23 14:21:30', 'App\\Models\\ElementPage', 0),
(3, 1, 2, 1, 0, 1, 1, 1, 'DNADesign\\Elemental\\Models\\ElementalArea', '2025-06-23 14:21:30', '2025-06-23 14:15:56', 'App\\Models\\ElementPage', 1);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `ElementContent`
--

CREATE TABLE `ElementContent` (
  `ID` int(11) NOT NULL,
  `HTML` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Daten für Tabelle `ElementContent`
--

INSERT INTO `ElementContent` (`ID`, `HTML`) VALUES
(1, '<p>The sun painted gentle patterns on the old cobblestone alleyway, while the aroma of fresh coffee and pastries wafted from a small bakery. It was a morning that could hardly have been more beautiful, and the city was slowly coming to life. Pigeons cooed softly on the rooftops and the first passers-by hurried along their way, enveloped in the still cool morning air. In such moments of silence and new beginnings, I often thought of the words of Swiss author Max Frisch, who once so aptly remarked: “One should not only want to change the world, one should also change one\'s life.” These seemingly simple words carry a profound truth. They remind us that it\'s not just about the big changes we long for, but also about the small, personal changes that shape our own existence and perspective. Perhaps it is precisely this balance between looking at the big picture and focusing on our own inner selves that enables us to truly grow and have a positive impact. A good demo text should not only convey information, but also inspire reflection, building a bridge to universal thoughts and feelings. It should gently captivate the reader and encourage them not only to read the lines, but also to feel them.</p>\n<p>Translated with DeepL.com (free version)</p>');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `ElementContent_Live`
--

CREATE TABLE `ElementContent_Live` (
  `ID` int(11) NOT NULL,
  `HTML` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Daten für Tabelle `ElementContent_Live`
--

INSERT INTO `ElementContent_Live` (`ID`, `HTML`) VALUES
(1, '<p>The sun painted gentle patterns on the old cobblestone alleyway, while the aroma of fresh coffee and pastries wafted from a small bakery. It was a morning that could hardly have been more beautiful, and the city was slowly coming to life. Pigeons cooed softly on the rooftops and the first passers-by hurried along their way, enveloped in the still cool morning air. In such moments of silence and new beginnings, I often thought of the words of Swiss author Max Frisch, who once so aptly remarked: “One should not only want to change the world, one should also change one\'s life.” These seemingly simple words carry a profound truth. They remind us that it\'s not just about the big changes we long for, but also about the small, personal changes that shape our own existence and perspective. Perhaps it is precisely this balance between looking at the big picture and focusing on our own inner selves that enables us to truly grow and have a positive impact. A good demo text should not only convey information, but also inspire reflection, building a bridge to universal thoughts and feelings. It should gently captivate the reader and encourage them not only to read the lines, but also to feel them.</p>\n<p>Translated with DeepL.com (free version)</p>');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `ElementContent_Localised`
--

CREATE TABLE `ElementContent_Localised` (
  `ID` int(11) NOT NULL,
  `RecordID` int(11) NOT NULL DEFAULT 0,
  `Locale` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `HTML` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Daten für Tabelle `ElementContent_Localised`
--

INSERT INTO `ElementContent_Localised` (`ID`, `RecordID`, `Locale`, `HTML`) VALUES
(1, 1, 'de_CH', '<p>Die Sonne malte sanfte Muster auf die alte Kopfsteinpflastergasse, während der Duft von frischem Kaffee und Gebäck aus einer kleinen Bäckerei wehte. Es war ein Morgen, wie er schöner kaum sein konnte, und die Stadt erwachte langsam zum Leben. Tauben gurrten leise auf den Dächern und die ersten Passanten eilten ihren Wegen nach, eingehüllt in die noch kühle Morgenluft.In solchen Momenten der Stille und des Beginns dachte ich oft an die Worte des Schweizer Autors Max Frisch, der einst so treffend bemerkte: „Man sollte nicht nur die Welt verändern wollen, man sollte auch das Leben ändern.“ Diese scheinbar einfachen Worte tragen eine tiefe Wahrheit in sich. Sie erinnern uns daran, dass es nicht nur um die großen Umwälzungen geht, die wir herbeisehnen, sondern auch um die kleinen, persönlichen Veränderungen, die unser eigenes Dasein und unsere Perspektive formen.Vielleicht ist es genau diese Balance zwischen dem Blick auf das große Ganze und dem Fokus auf das eigene Innere, die uns befähigt, wirklich zu wachsen und einen positiven Einfluss zu nehmen. Ein guter Demo-Text sollte nicht nur Informationen vermitteln, sondern auch zum Nachdenken anregen, eine Brücke schlagen zu universellen Gedanken und Gefühlen. Er sollte den Leser sanft einfangen und ihn dazu ermutigen, die Zeilen nicht nur zu lesen, sondern auch zu fühlen.</p>'),
(2, 1, 'en_US', '<p>The sun painted gentle patterns on the old cobblestone alleyway, while the aroma of fresh coffee and pastries wafted from a small bakery. It was a morning that could hardly have been more beautiful, and the city was slowly coming to life. Pigeons cooed softly on the rooftops and the first passers-by hurried along their way, enveloped in the still cool morning air. In such moments of silence and new beginnings, I often thought of the words of Swiss author Max Frisch, who once so aptly remarked: “One should not only want to change the world, one should also change one\'s life.” These seemingly simple words carry a profound truth. They remind us that it\'s not just about the big changes we long for, but also about the small, personal changes that shape our own existence and perspective. Perhaps it is precisely this balance between looking at the big picture and focusing on our own inner selves that enables us to truly grow and have a positive impact. A good demo text should not only convey information, but also inspire reflection, building a bridge to universal thoughts and feelings. It should gently captivate the reader and encourage them not only to read the lines, but also to feel them.</p>\n<p>Translated with DeepL.com (free version)</p>');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `ElementContent_Localised_Live`
--

CREATE TABLE `ElementContent_Localised_Live` (
  `ID` int(11) NOT NULL,
  `RecordID` int(11) NOT NULL DEFAULT 0,
  `Locale` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `HTML` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Daten für Tabelle `ElementContent_Localised_Live`
--

INSERT INTO `ElementContent_Localised_Live` (`ID`, `RecordID`, `Locale`, `HTML`) VALUES
(1, 1, 'de_CH', '<p>Die Sonne malte sanfte Muster auf die alte Kopfsteinpflastergasse, während der Duft von frischem Kaffee und Gebäck aus einer kleinen Bäckerei wehte. Es war ein Morgen, wie er schöner kaum sein konnte, und die Stadt erwachte langsam zum Leben. Tauben gurrten leise auf den Dächern und die ersten Passanten eilten ihren Wegen nach, eingehüllt in die noch kühle Morgenluft.In solchen Momenten der Stille und des Beginns dachte ich oft an die Worte des Schweizer Autors Max Frisch, der einst so treffend bemerkte: „Man sollte nicht nur die Welt verändern wollen, man sollte auch das Leben ändern.“ Diese scheinbar einfachen Worte tragen eine tiefe Wahrheit in sich. Sie erinnern uns daran, dass es nicht nur um die großen Umwälzungen geht, die wir herbeisehnen, sondern auch um die kleinen, persönlichen Veränderungen, die unser eigenes Dasein und unsere Perspektive formen.Vielleicht ist es genau diese Balance zwischen dem Blick auf das große Ganze und dem Fokus auf das eigene Innere, die uns befähigt, wirklich zu wachsen und einen positiven Einfluss zu nehmen. Ein guter Demo-Text sollte nicht nur Informationen vermitteln, sondern auch zum Nachdenken anregen, eine Brücke schlagen zu universellen Gedanken und Gefühlen. Er sollte den Leser sanft einfangen und ihn dazu ermutigen, die Zeilen nicht nur zu lesen, sondern auch zu fühlen.</p>'),
(2, 1, 'en_US', '<p>The sun painted gentle patterns on the old cobblestone alleyway, while the aroma of fresh coffee and pastries wafted from a small bakery. It was a morning that could hardly have been more beautiful, and the city was slowly coming to life. Pigeons cooed softly on the rooftops and the first passers-by hurried along their way, enveloped in the still cool morning air. In such moments of silence and new beginnings, I often thought of the words of Swiss author Max Frisch, who once so aptly remarked: “One should not only want to change the world, one should also change one\'s life.” These seemingly simple words carry a profound truth. They remind us that it\'s not just about the big changes we long for, but also about the small, personal changes that shape our own existence and perspective. Perhaps it is precisely this balance between looking at the big picture and focusing on our own inner selves that enables us to truly grow and have a positive impact. A good demo text should not only convey information, but also inspire reflection, building a bridge to universal thoughts and feelings. It should gently captivate the reader and encourage them not only to read the lines, but also to feel them.</p>\n<p>Translated with DeepL.com (free version)</p>');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `ElementContent_Localised_Versions`
--

CREATE TABLE `ElementContent_Localised_Versions` (
  `Version` int(11) NOT NULL DEFAULT 0,
  `ID` int(11) NOT NULL,
  `RecordID` int(11) NOT NULL DEFAULT 0,
  `Locale` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `HTML` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Daten für Tabelle `ElementContent_Localised_Versions`
--

INSERT INTO `ElementContent_Localised_Versions` (`Version`, `ID`, `RecordID`, `Locale`, `HTML`) VALUES
(1, 1, 1, 'de_CH', NULL),
(2, 2, 1, 'de_CH', '<p>Die Sonne malte sanfte Muster auf die alte Kopfsteinpflastergasse, während der Duft von frischem Kaffee und Gebäck aus einer kleinen Bäckerei wehte. Es war ein Morgen, wie er schöner kaum sein konnte, und die Stadt erwachte langsam zum Leben. Tauben gurrten leise auf den Dächern und die ersten Passanten eilten ihren Wegen nach, eingehüllt in die noch kühle Morgenluft.In solchen Momenten der Stille und des Beginns dachte ich oft an die Worte des Schweizer Autors Max Frisch, der einst so treffend bemerkte: „Man sollte nicht nur die Welt verändern wollen, man sollte auch das Leben ändern.“ Diese scheinbar einfachen Worte tragen eine tiefe Wahrheit in sich. Sie erinnern uns daran, dass es nicht nur um die großen Umwälzungen geht, die wir herbeisehnen, sondern auch um die kleinen, persönlichen Veränderungen, die unser eigenes Dasein und unsere Perspektive formen.Vielleicht ist es genau diese Balance zwischen dem Blick auf das große Ganze und dem Fokus auf das eigene Innere, die uns befähigt, wirklich zu wachsen und einen positiven Einfluss zu nehmen. Ein guter Demo-Text sollte nicht nur Informationen vermitteln, sondern auch zum Nachdenken anregen, eine Brücke schlagen zu universellen Gedanken und Gefühlen. Er sollte den Leser sanft einfangen und ihn dazu ermutigen, die Zeilen nicht nur zu lesen, sondern auch zu fühlen.</p>'),
(3, 3, 1, 'de_CH', '<p>Die Sonne malte sanfte Muster auf die alte Kopfsteinpflastergasse, während der Duft von frischem Kaffee und Gebäck aus einer kleinen Bäckerei wehte. Es war ein Morgen, wie er schöner kaum sein konnte, und die Stadt erwachte langsam zum Leben. Tauben gurrten leise auf den Dächern und die ersten Passanten eilten ihren Wegen nach, eingehüllt in die noch kühle Morgenluft.In solchen Momenten der Stille und des Beginns dachte ich oft an die Worte des Schweizer Autors Max Frisch, der einst so treffend bemerkte: „Man sollte nicht nur die Welt verändern wollen, man sollte auch das Leben ändern.“ Diese scheinbar einfachen Worte tragen eine tiefe Wahrheit in sich. Sie erinnern uns daran, dass es nicht nur um die großen Umwälzungen geht, die wir herbeisehnen, sondern auch um die kleinen, persönlichen Veränderungen, die unser eigenes Dasein und unsere Perspektive formen.Vielleicht ist es genau diese Balance zwischen dem Blick auf das große Ganze und dem Fokus auf das eigene Innere, die uns befähigt, wirklich zu wachsen und einen positiven Einfluss zu nehmen. Ein guter Demo-Text sollte nicht nur Informationen vermitteln, sondern auch zum Nachdenken anregen, eine Brücke schlagen zu universellen Gedanken und Gefühlen. Er sollte den Leser sanft einfangen und ihn dazu ermutigen, die Zeilen nicht nur zu lesen, sondern auch zu fühlen.</p>'),
(4, 4, 1, 'en_US', '<p>Die Sonne malte sanfte Muster auf die alte Kopfsteinpflastergasse, während der Duft von frischem Kaffee und Gebäck aus einer kleinen Bäckerei wehte. Es war ein Morgen, wie er schöner kaum sein konnte, und die Stadt erwachte langsam zum Leben. Tauben gurrten leise auf den Dächern und die ersten Passanten eilten ihren Wegen nach, eingehüllt in die noch kühle Morgenluft.In solchen Momenten der Stille und des Beginns dachte ich oft an die Worte des Schweizer Autors Max Frisch, der einst so treffend bemerkte: „Man sollte nicht nur die Welt verändern wollen, man sollte auch das Leben ändern.“ Diese scheinbar einfachen Worte tragen eine tiefe Wahrheit in sich. Sie erinnern uns daran, dass es nicht nur um die großen Umwälzungen geht, die wir herbeisehnen, sondern auch um die kleinen, persönlichen Veränderungen, die unser eigenes Dasein und unsere Perspektive formen.Vielleicht ist es genau diese Balance zwischen dem Blick auf das große Ganze und dem Fokus auf das eigene Innere, die uns befähigt, wirklich zu wachsen und einen positiven Einfluss zu nehmen. Ein guter Demo-Text sollte nicht nur Informationen vermitteln, sondern auch zum Nachdenken anregen, eine Brücke schlagen zu universellen Gedanken und Gefühlen. Er sollte den Leser sanft einfangen und ihn dazu ermutigen, die Zeilen nicht nur zu lesen, sondern auch zu fühlen.</p>'),
(5, 5, 1, 'en_US', '<p>The sun painted gentle patterns on the old cobblestone alleyway, while the aroma of fresh coffee and pastries wafted from a small bakery. It was a morning that could hardly have been more beautiful, and the city was slowly coming to life. Pigeons cooed softly on the rooftops and the first passers-by hurried along their way, enveloped in the still cool morning air. In such moments of silence and new beginnings, I often thought of the words of Swiss author Max Frisch, who once so aptly remarked: “One should not only want to change the world, one should also change one\'s life.” These seemingly simple words carry a profound truth. They remind us that it\'s not just about the big changes we long for, but also about the small, personal changes that shape our own existence and perspective. Perhaps it is precisely this balance between looking at the big picture and focusing on our own inner selves that enables us to truly grow and have a positive impact. A good demo text should not only convey information, but also inspire reflection, building a bridge to universal thoughts and feelings. It should gently captivate the reader and encourage them not only to read the lines, but also to feel them.</p>\n<p>Translated with DeepL.com (free version)</p>'),
(6, 6, 1, 'en_US', '<p>The sun painted gentle patterns on the old cobblestone alleyway, while the aroma of fresh coffee and pastries wafted from a small bakery. It was a morning that could hardly have been more beautiful, and the city was slowly coming to life. Pigeons cooed softly on the rooftops and the first passers-by hurried along their way, enveloped in the still cool morning air. In such moments of silence and new beginnings, I often thought of the words of Swiss author Max Frisch, who once so aptly remarked: “One should not only want to change the world, one should also change one\'s life.” These seemingly simple words carry a profound truth. They remind us that it\'s not just about the big changes we long for, but also about the small, personal changes that shape our own existence and perspective. Perhaps it is precisely this balance between looking at the big picture and focusing on our own inner selves that enables us to truly grow and have a positive impact. A good demo text should not only convey information, but also inspire reflection, building a bridge to universal thoughts and feelings. It should gently captivate the reader and encourage them not only to read the lines, but also to feel them.</p>\n<p>Translated with DeepL.com (free version)</p>'),
(7, 7, 1, 'en_US', '<p>The sun painted gentle patterns on the old cobblestone alleyway, while the aroma of fresh coffee and pastries wafted from a small bakery. It was a morning that could hardly have been more beautiful, and the city was slowly coming to life. Pigeons cooed softly on the rooftops and the first passers-by hurried along their way, enveloped in the still cool morning air. In such moments of silence and new beginnings, I often thought of the words of Swiss author Max Frisch, who once so aptly remarked: “One should not only want to change the world, one should also change one\'s life.” These seemingly simple words carry a profound truth. They remind us that it\'s not just about the big changes we long for, but also about the small, personal changes that shape our own existence and perspective. Perhaps it is precisely this balance between looking at the big picture and focusing on our own inner selves that enables us to truly grow and have a positive impact. A good demo text should not only convey information, but also inspire reflection, building a bridge to universal thoughts and feelings. It should gently captivate the reader and encourage them not only to read the lines, but also to feel them.</p>\n<p>Translated with DeepL.com (free version)</p>');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `ElementContent_Versions`
--

CREATE TABLE `ElementContent_Versions` (
  `ID` int(11) NOT NULL,
  `RecordID` int(11) NOT NULL DEFAULT 0,
  `Version` int(11) NOT NULL DEFAULT 0,
  `HTML` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Daten für Tabelle `ElementContent_Versions`
--

INSERT INTO `ElementContent_Versions` (`ID`, `RecordID`, `Version`, `HTML`) VALUES
(1, 1, 1, NULL),
(2, 1, 2, '<p>Die Sonne malte sanfte Muster auf die alte Kopfsteinpflastergasse, während der Duft von frischem Kaffee und Gebäck aus einer kleinen Bäckerei wehte. Es war ein Morgen, wie er schöner kaum sein konnte, und die Stadt erwachte langsam zum Leben. Tauben gurrten leise auf den Dächern und die ersten Passanten eilten ihren Wegen nach, eingehüllt in die noch kühle Morgenluft.In solchen Momenten der Stille und des Beginns dachte ich oft an die Worte des Schweizer Autors Max Frisch, der einst so treffend bemerkte: „Man sollte nicht nur die Welt verändern wollen, man sollte auch das Leben ändern.“ Diese scheinbar einfachen Worte tragen eine tiefe Wahrheit in sich. Sie erinnern uns daran, dass es nicht nur um die großen Umwälzungen geht, die wir herbeisehnen, sondern auch um die kleinen, persönlichen Veränderungen, die unser eigenes Dasein und unsere Perspektive formen.Vielleicht ist es genau diese Balance zwischen dem Blick auf das große Ganze und dem Fokus auf das eigene Innere, die uns befähigt, wirklich zu wachsen und einen positiven Einfluss zu nehmen. Ein guter Demo-Text sollte nicht nur Informationen vermitteln, sondern auch zum Nachdenken anregen, eine Brücke schlagen zu universellen Gedanken und Gefühlen. Er sollte den Leser sanft einfangen und ihn dazu ermutigen, die Zeilen nicht nur zu lesen, sondern auch zu fühlen.</p>'),
(3, 1, 3, '<p>Die Sonne malte sanfte Muster auf die alte Kopfsteinpflastergasse, während der Duft von frischem Kaffee und Gebäck aus einer kleinen Bäckerei wehte. Es war ein Morgen, wie er schöner kaum sein konnte, und die Stadt erwachte langsam zum Leben. Tauben gurrten leise auf den Dächern und die ersten Passanten eilten ihren Wegen nach, eingehüllt in die noch kühle Morgenluft.In solchen Momenten der Stille und des Beginns dachte ich oft an die Worte des Schweizer Autors Max Frisch, der einst so treffend bemerkte: „Man sollte nicht nur die Welt verändern wollen, man sollte auch das Leben ändern.“ Diese scheinbar einfachen Worte tragen eine tiefe Wahrheit in sich. Sie erinnern uns daran, dass es nicht nur um die großen Umwälzungen geht, die wir herbeisehnen, sondern auch um die kleinen, persönlichen Veränderungen, die unser eigenes Dasein und unsere Perspektive formen.Vielleicht ist es genau diese Balance zwischen dem Blick auf das große Ganze und dem Fokus auf das eigene Innere, die uns befähigt, wirklich zu wachsen und einen positiven Einfluss zu nehmen. Ein guter Demo-Text sollte nicht nur Informationen vermitteln, sondern auch zum Nachdenken anregen, eine Brücke schlagen zu universellen Gedanken und Gefühlen. Er sollte den Leser sanft einfangen und ihn dazu ermutigen, die Zeilen nicht nur zu lesen, sondern auch zu fühlen.</p>'),
(4, 1, 4, '<p>Die Sonne malte sanfte Muster auf die alte Kopfsteinpflastergasse, während der Duft von frischem Kaffee und Gebäck aus einer kleinen Bäckerei wehte. Es war ein Morgen, wie er schöner kaum sein konnte, und die Stadt erwachte langsam zum Leben. Tauben gurrten leise auf den Dächern und die ersten Passanten eilten ihren Wegen nach, eingehüllt in die noch kühle Morgenluft.In solchen Momenten der Stille und des Beginns dachte ich oft an die Worte des Schweizer Autors Max Frisch, der einst so treffend bemerkte: „Man sollte nicht nur die Welt verändern wollen, man sollte auch das Leben ändern.“ Diese scheinbar einfachen Worte tragen eine tiefe Wahrheit in sich. Sie erinnern uns daran, dass es nicht nur um die großen Umwälzungen geht, die wir herbeisehnen, sondern auch um die kleinen, persönlichen Veränderungen, die unser eigenes Dasein und unsere Perspektive formen.Vielleicht ist es genau diese Balance zwischen dem Blick auf das große Ganze und dem Fokus auf das eigene Innere, die uns befähigt, wirklich zu wachsen und einen positiven Einfluss zu nehmen. Ein guter Demo-Text sollte nicht nur Informationen vermitteln, sondern auch zum Nachdenken anregen, eine Brücke schlagen zu universellen Gedanken und Gefühlen. Er sollte den Leser sanft einfangen und ihn dazu ermutigen, die Zeilen nicht nur zu lesen, sondern auch zu fühlen.</p>'),
(5, 1, 5, '<p>The sun painted gentle patterns on the old cobblestone alleyway, while the aroma of fresh coffee and pastries wafted from a small bakery. It was a morning that could hardly have been more beautiful, and the city was slowly coming to life. Pigeons cooed softly on the rooftops and the first passers-by hurried along their way, enveloped in the still cool morning air. In such moments of silence and new beginnings, I often thought of the words of Swiss author Max Frisch, who once so aptly remarked: “One should not only want to change the world, one should also change one\'s life.” These seemingly simple words carry a profound truth. They remind us that it\'s not just about the big changes we long for, but also about the small, personal changes that shape our own existence and perspective. Perhaps it is precisely this balance between looking at the big picture and focusing on our own inner selves that enables us to truly grow and have a positive impact. A good demo text should not only convey information, but also inspire reflection, building a bridge to universal thoughts and feelings. It should gently captivate the reader and encourage them not only to read the lines, but also to feel them.</p>\n<p>Translated with DeepL.com (free version)</p>'),
(6, 1, 6, '<p>The sun painted gentle patterns on the old cobblestone alleyway, while the aroma of fresh coffee and pastries wafted from a small bakery. It was a morning that could hardly have been more beautiful, and the city was slowly coming to life. Pigeons cooed softly on the rooftops and the first passers-by hurried along their way, enveloped in the still cool morning air. In such moments of silence and new beginnings, I often thought of the words of Swiss author Max Frisch, who once so aptly remarked: “One should not only want to change the world, one should also change one\'s life.” These seemingly simple words carry a profound truth. They remind us that it\'s not just about the big changes we long for, but also about the small, personal changes that shape our own existence and perspective. Perhaps it is precisely this balance between looking at the big picture and focusing on our own inner selves that enables us to truly grow and have a positive impact. A good demo text should not only convey information, but also inspire reflection, building a bridge to universal thoughts and feelings. It should gently captivate the reader and encourage them not only to read the lines, but also to feel them.</p>\n<p>Translated with DeepL.com (free version)</p>'),
(7, 1, 7, '<p>The sun painted gentle patterns on the old cobblestone alleyway, while the aroma of fresh coffee and pastries wafted from a small bakery. It was a morning that could hardly have been more beautiful, and the city was slowly coming to life. Pigeons cooed softly on the rooftops and the first passers-by hurried along their way, enveloped in the still cool morning air. In such moments of silence and new beginnings, I often thought of the words of Swiss author Max Frisch, who once so aptly remarked: “One should not only want to change the world, one should also change one\'s life.” These seemingly simple words carry a profound truth. They remind us that it\'s not just about the big changes we long for, but also about the small, personal changes that shape our own existence and perspective. Perhaps it is precisely this balance between looking at the big picture and focusing on our own inner selves that enables us to truly grow and have a positive impact. A good demo text should not only convey information, but also inspire reflection, building a bridge to universal thoughts and feelings. It should gently captivate the reader and encourage them not only to read the lines, but also to feel them.</p>\n<p>Translated with DeepL.com (free version)</p>');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `ElementForm`
--

CREATE TABLE `ElementForm` (
  `ID` int(11) NOT NULL,
  `SubmitButtonText` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ClearButtonText` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `OnCompleteMessage` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ShowClearButton` tinyint(1) UNSIGNED NOT NULL DEFAULT 0,
  `DisableSaveSubmissions` tinyint(1) UNSIGNED NOT NULL DEFAULT 0,
  `EnableLiveValidation` tinyint(1) UNSIGNED NOT NULL DEFAULT 0,
  `DisplayErrorMessagesAtTop` tinyint(1) UNSIGNED NOT NULL DEFAULT 0,
  `DisableAuthenicatedFinishAction` tinyint(1) UNSIGNED NOT NULL DEFAULT 0,
  `DisableCsrfSecurityToken` tinyint(1) UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `ElementForm_Live`
--

CREATE TABLE `ElementForm_Live` (
  `ID` int(11) NOT NULL,
  `SubmitButtonText` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ClearButtonText` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `OnCompleteMessage` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ShowClearButton` tinyint(1) UNSIGNED NOT NULL DEFAULT 0,
  `DisableSaveSubmissions` tinyint(1) UNSIGNED NOT NULL DEFAULT 0,
  `EnableLiveValidation` tinyint(1) UNSIGNED NOT NULL DEFAULT 0,
  `DisplayErrorMessagesAtTop` tinyint(1) UNSIGNED NOT NULL DEFAULT 0,
  `DisableAuthenicatedFinishAction` tinyint(1) UNSIGNED NOT NULL DEFAULT 0,
  `DisableCsrfSecurityToken` tinyint(1) UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `ElementForm_Localised`
--

CREATE TABLE `ElementForm_Localised` (
  `ID` int(11) NOT NULL,
  `RecordID` int(11) NOT NULL DEFAULT 0,
  `Locale` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `SubmitButtonText` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ClearButtonText` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `OnCompleteMessage` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `ElementForm_Localised_Live`
--

CREATE TABLE `ElementForm_Localised_Live` (
  `ID` int(11) NOT NULL,
  `RecordID` int(11) NOT NULL DEFAULT 0,
  `Locale` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `SubmitButtonText` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ClearButtonText` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `OnCompleteMessage` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `ElementForm_Localised_Versions`
--

CREATE TABLE `ElementForm_Localised_Versions` (
  `Version` int(11) NOT NULL DEFAULT 0,
  `ID` int(11) NOT NULL,
  `RecordID` int(11) NOT NULL DEFAULT 0,
  `Locale` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `SubmitButtonText` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ClearButtonText` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `OnCompleteMessage` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `ElementForm_Versions`
--

CREATE TABLE `ElementForm_Versions` (
  `ID` int(11) NOT NULL,
  `RecordID` int(11) NOT NULL DEFAULT 0,
  `Version` int(11) NOT NULL DEFAULT 0,
  `SubmitButtonText` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ClearButtonText` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `OnCompleteMessage` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ShowClearButton` tinyint(1) UNSIGNED NOT NULL DEFAULT 0,
  `DisableSaveSubmissions` tinyint(1) UNSIGNED NOT NULL DEFAULT 0,
  `EnableLiveValidation` tinyint(1) UNSIGNED NOT NULL DEFAULT 0,
  `DisplayErrorMessagesAtTop` tinyint(1) UNSIGNED NOT NULL DEFAULT 0,
  `DisableAuthenicatedFinishAction` tinyint(1) UNSIGNED NOT NULL DEFAULT 0,
  `DisableCsrfSecurityToken` tinyint(1) UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `ElementPage`
--

CREATE TABLE `ElementPage` (
  `ID` int(11) NOT NULL,
  `ElementalAreaID` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Daten für Tabelle `ElementPage`
--

INSERT INTO `ElementPage` (`ID`, `ElementalAreaID`) VALUES
(1, 1);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `ElementPage_Live`
--

CREATE TABLE `ElementPage_Live` (
  `ID` int(11) NOT NULL,
  `ElementalAreaID` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Daten für Tabelle `ElementPage_Live`
--

INSERT INTO `ElementPage_Live` (`ID`, `ElementalAreaID`) VALUES
(1, 1);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `ElementPage_Versions`
--

CREATE TABLE `ElementPage_Versions` (
  `ID` int(11) NOT NULL,
  `RecordID` int(11) NOT NULL DEFAULT 0,
  `Version` int(11) NOT NULL DEFAULT 0,
  `ElementalAreaID` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Daten für Tabelle `ElementPage_Versions`
--

INSERT INTO `ElementPage_Versions` (`ID`, `RecordID`, `Version`, `ElementalAreaID`) VALUES
(1, 1, 1, 1),
(2, 1, 2, 1),
(3, 1, 3, 1),
(4, 1, 4, 1),
(5, 1, 5, 1),
(6, 1, 6, 1);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `ElementVirtual`
--

CREATE TABLE `ElementVirtual` (
  `ID` int(11) NOT NULL,
  `LinkedElementID` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `ElementVirtual_Live`
--

CREATE TABLE `ElementVirtual_Live` (
  `ID` int(11) NOT NULL,
  `LinkedElementID` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `ElementVirtual_Versions`
--

CREATE TABLE `ElementVirtual_Versions` (
  `ID` int(11) NOT NULL,
  `RecordID` int(11) NOT NULL DEFAULT 0,
  `Version` int(11) NOT NULL DEFAULT 0,
  `LinkedElementID` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `Element_Live`
--

CREATE TABLE `Element_Live` (
  `ID` int(11) NOT NULL,
  `ClassName` enum('DNADesign\\Elemental\\Models\\BaseElement','DNADesign\\Elemental\\Models\\ElementContent','DNADesign\\ElementalUserForms\\Model\\ElementForm','DNADesign\\ElementalVirtual\\Model\\ElementVirtual') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'DNADesign\\Elemental\\Models\\BaseElement',
  `LastEdited` datetime DEFAULT NULL,
  `Created` datetime DEFAULT NULL,
  `AvailableGlobally` tinyint(1) UNSIGNED NOT NULL DEFAULT 1,
  `VirtualLookupTitle` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Version` int(11) NOT NULL DEFAULT 0,
  `Title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ShowTitle` tinyint(1) UNSIGNED NOT NULL DEFAULT 0,
  `Sort` int(11) NOT NULL DEFAULT 0,
  `ExtraClass` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Style` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `TopPageID` int(11) NOT NULL DEFAULT 0,
  `ParentID` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Daten für Tabelle `Element_Live`
--

INSERT INTO `Element_Live` (`ID`, `ClassName`, `LastEdited`, `Created`, `AvailableGlobally`, `VirtualLookupTitle`, `Version`, `Title`, `ShowTitle`, `Sort`, `ExtraClass`, `Style`, `TopPageID`, `ParentID`) VALUES
(1, 'DNADesign\\Elemental\\Models\\ElementContent', '2025-06-23 14:24:07', '2025-06-23 14:16:16', 1, 'The sun painted gentle patterns (Text #1)', 7, 'The sun painted gentle patterns', 1, 1, NULL, NULL, 1, 1);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `Element_Localised`
--

CREATE TABLE `Element_Localised` (
  `ID` int(11) NOT NULL,
  `RecordID` int(11) NOT NULL DEFAULT 0,
  `Locale` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ExtraClass` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Style` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Daten für Tabelle `Element_Localised`
--

INSERT INTO `Element_Localised` (`ID`, `RecordID`, `Locale`, `Title`, `ExtraClass`, `Style`) VALUES
(1, 1, 'de_CH', 'Die Sonne malte sanfte Muster', NULL, NULL),
(2, 1, 'en_US', 'The sun painted gentle patterns', NULL, NULL);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `Element_Localised_Live`
--

CREATE TABLE `Element_Localised_Live` (
  `ID` int(11) NOT NULL,
  `RecordID` int(11) NOT NULL DEFAULT 0,
  `Locale` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ExtraClass` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Style` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Daten für Tabelle `Element_Localised_Live`
--

INSERT INTO `Element_Localised_Live` (`ID`, `RecordID`, `Locale`, `Title`, `ExtraClass`, `Style`) VALUES
(1, 1, 'de_CH', 'Die Sonne malte sanfte Muster', NULL, NULL),
(2, 1, 'en_US', 'The sun painted gentle patterns', NULL, NULL);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `Element_Localised_Versions`
--

CREATE TABLE `Element_Localised_Versions` (
  `Version` int(11) NOT NULL DEFAULT 0,
  `ID` int(11) NOT NULL,
  `RecordID` int(11) NOT NULL DEFAULT 0,
  `Locale` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ExtraClass` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Style` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Daten für Tabelle `Element_Localised_Versions`
--

INSERT INTO `Element_Localised_Versions` (`Version`, `ID`, `RecordID`, `Locale`, `Title`, `ExtraClass`, `Style`) VALUES
(1, 1, 1, 'de_CH', NULL, NULL, NULL),
(2, 2, 1, 'de_CH', 'Die Sonne malte sanfte Muster', NULL, NULL),
(3, 3, 1, 'de_CH', 'Die Sonne malte sanfte Muster', NULL, NULL),
(4, 4, 1, 'en_US', 'Die Sonne malte sanfte Muster', NULL, NULL),
(5, 5, 1, 'en_US', 'The sun painted gentle patterns', NULL, NULL),
(6, 6, 1, 'en_US', 'The sun painted gentle patterns', NULL, NULL),
(7, 7, 1, 'en_US', 'The sun painted gentle patterns', NULL, NULL);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `Element_Versions`
--

CREATE TABLE `Element_Versions` (
  `ID` int(11) NOT NULL,
  `RecordID` int(11) NOT NULL DEFAULT 0,
  `Version` int(11) NOT NULL DEFAULT 0,
  `WasPublished` tinyint(1) UNSIGNED NOT NULL DEFAULT 0,
  `WasDeleted` tinyint(1) UNSIGNED NOT NULL DEFAULT 0,
  `WasDraft` tinyint(1) UNSIGNED NOT NULL DEFAULT 1,
  `AuthorID` int(11) NOT NULL DEFAULT 0,
  `PublisherID` int(11) NOT NULL DEFAULT 0,
  `ClassName` enum('DNADesign\\Elemental\\Models\\BaseElement','DNADesign\\Elemental\\Models\\ElementContent','DNADesign\\ElementalUserForms\\Model\\ElementForm','DNADesign\\ElementalVirtual\\Model\\ElementVirtual') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'DNADesign\\Elemental\\Models\\BaseElement',
  `LastEdited` datetime DEFAULT NULL,
  `Created` datetime DEFAULT NULL,
  `AvailableGlobally` tinyint(1) UNSIGNED NOT NULL DEFAULT 1,
  `VirtualLookupTitle` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ShowTitle` tinyint(1) UNSIGNED NOT NULL DEFAULT 0,
  `Sort` int(11) NOT NULL DEFAULT 0,
  `ExtraClass` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Style` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `TopPageID` int(11) NOT NULL DEFAULT 0,
  `ParentID` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Daten für Tabelle `Element_Versions`
--

INSERT INTO `Element_Versions` (`ID`, `RecordID`, `Version`, `WasPublished`, `WasDeleted`, `WasDraft`, `AuthorID`, `PublisherID`, `ClassName`, `LastEdited`, `Created`, `AvailableGlobally`, `VirtualLookupTitle`, `Title`, `ShowTitle`, `Sort`, `ExtraClass`, `Style`, `TopPageID`, `ParentID`) VALUES
(1, 1, 1, 0, 0, 1, 1, 0, 'DNADesign\\Elemental\\Models\\ElementContent', '2025-06-23 14:16:16', '2025-06-23 14:16:16', 1, ' (Text #0)', NULL, 0, 1, NULL, NULL, 0, 1),
(2, 1, 2, 0, 0, 1, 1, 0, 'DNADesign\\Elemental\\Models\\ElementContent', '2025-06-23 14:21:10', '2025-06-23 14:16:16', 1, 'Die Sonne malte sanfte Muster (Text #1)', 'Die Sonne malte sanfte Muster', 1, 1, NULL, NULL, 1, 1),
(3, 1, 3, 1, 0, 1, 1, 1, 'DNADesign\\Elemental\\Models\\ElementContent', '2025-06-23 14:21:30', '2025-06-23 14:16:16', 1, 'Die Sonne malte sanfte Muster (Text #1)', 'Die Sonne malte sanfte Muster', 1, 1, NULL, NULL, 1, 1),
(4, 1, 4, 1, 0, 1, 1, 1, 'DNADesign\\Elemental\\Models\\ElementContent', '2025-06-23 14:22:02', '2025-06-23 14:16:16', 1, 'Die Sonne malte sanfte Muster (Text #1)', 'Die Sonne malte sanfte Muster', 1, 1, NULL, NULL, 1, 1),
(5, 1, 5, 0, 0, 1, 1, 0, 'DNADesign\\Elemental\\Models\\ElementContent', '2025-06-23 14:24:00', '2025-06-23 14:16:16', 1, 'The sun painted gentle patterns (Text #1)', 'The sun painted gentle patterns', 1, 1, NULL, NULL, 1, 1),
(6, 1, 6, 1, 0, 1, 1, 1, 'DNADesign\\Elemental\\Models\\ElementContent', '2025-06-23 14:24:00', '2025-06-23 14:16:16', 1, 'The sun painted gentle patterns (Text #1)', 'The sun painted gentle patterns', 1, 1, NULL, NULL, 1, 1),
(7, 1, 7, 1, 0, 1, 1, 1, 'DNADesign\\Elemental\\Models\\ElementContent', '2025-06-23 14:24:07', '2025-06-23 14:16:16', 1, 'The sun painted gentle patterns (Text #1)', 'The sun painted gentle patterns', 1, 1, NULL, NULL, 1, 1);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `File`
--

CREATE TABLE `File` (
  `ID` int(11) NOT NULL,
  `ClassName` enum('SilverStripe\\Assets\\File','SilverStripe\\Assets\\Folder','SilverStripe\\Assets\\Image') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'SilverStripe\\Assets\\File',
  `LastEdited` datetime DEFAULT NULL,
  `Created` datetime DEFAULT NULL,
  `Version` int(11) NOT NULL DEFAULT 0,
  `UserFormUpload` enum('f','t') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CanViewType` enum('Anyone','LoggedInUsers','OnlyTheseUsers','OnlyTheseMembers','Inherit') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'Inherit',
  `CanEditType` enum('LoggedInUsers','OnlyTheseUsers','OnlyTheseMembers','Inherit') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'Inherit',
  `Name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ShowInSearch` tinyint(1) UNSIGNED NOT NULL DEFAULT 1,
  `ParentID` int(11) NOT NULL DEFAULT 0,
  `OwnerID` int(11) NOT NULL DEFAULT 0,
  `FileHash` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `FileFilename` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `FileVariant` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `FileLink`
--

CREATE TABLE `FileLink` (
  `ID` int(11) NOT NULL,
  `ClassName` enum('SilverStripe\\Assets\\Shortcodes\\FileLink') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'SilverStripe\\Assets\\Shortcodes\\FileLink',
  `LastEdited` datetime DEFAULT NULL,
  `Created` datetime DEFAULT NULL,
  `LinkedID` int(11) NOT NULL DEFAULT 0,
  `ParentID` int(11) NOT NULL DEFAULT 0,
  `ParentClass` enum('SilverStripe\\Assets\\File','SilverStripe\\SiteConfig\\SiteConfig','SilverStripe\\Versioned\\ChangeSet','SilverStripe\\Versioned\\ChangeSetItem','DNADesign\\Elemental\\Models\\BaseElement','DNADesign\\Elemental\\Models\\ElementalArea','SilverStripe\\Assets\\Shortcodes\\FileLink','SilverStripe\\Blog\\Model\\BlogCategory','SilverStripe\\Blog\\Model\\BlogTag','SilverStripe\\CMS\\Model\\SiteTree','SilverStripe\\CMS\\Model\\SiteTreeLink','SilverStripe\\Security\\Group','SilverStripe\\Security\\LoginAttempt','SilverStripe\\Security\\Member','SilverStripe\\Security\\MemberPassword','SilverStripe\\Security\\Permission','SilverStripe\\Security\\PermissionRole','SilverStripe\\Security\\PermissionRoleCode','SilverStripe\\Security\\RememberLoginHash','SilverStripe\\UserForms\\Model\\EditableCustomRule','SilverStripe\\UserForms\\Model\\EditableFormField','TractorCow\\Fluent\\Model\\Domain','TractorCow\\Fluent\\Model\\FallbackLocale','TractorCow\\Fluent\\Model\\Locale','SilverStripe\\UserForms\\Model\\EditableFormField\\EditableOption','SilverStripe\\UserForms\\Model\\Recipient\\EmailRecipient','SilverStripe\\UserForms\\Model\\Recipient\\EmailRecipientCondition','SilverStripe\\UserForms\\Model\\Submission\\SubmittedForm','SilverStripe\\UserForms\\Model\\Submission\\SubmittedFormField','SilverStripe\\Assets\\Folder','SilverStripe\\Assets\\Image','DNADesign\\Elemental\\Models\\ElementContent','DNADesign\\ElementalUserForms\\Model\\ElementForm','DNADesign\\ElementalVirtual\\Model\\ElementVirtual','Page','App\\Models\\ElementPage','SilverStripe\\Blog\\Model\\Blog','SilverStripe\\Blog\\Model\\BlogPost','SilverStripe\\CMS\\Model\\RedirectorPage','SilverStripe\\CMS\\Model\\VirtualPage','SilverStripe\\UserForms\\Model\\UserDefinedForm','App\\Models\\EditableFormField\\EditableCheckboxTerms','SilverStripe\\UserForms\\Model\\EditableFormField\\EditableCheckbox','SilverStripe\\UserForms\\Model\\EditableFormField\\EditableCountryDropdownField','SilverStripe\\UserForms\\Model\\EditableFormField\\EditableDateField','SilverStripe\\UserForms\\Model\\EditableFormField\\EditableEmailField','SilverStripe\\UserForms\\Model\\EditableFormField\\EditableFieldGroup','SilverStripe\\UserForms\\Model\\EditableFormField\\EditableFieldGroupEnd','SilverStripe\\UserForms\\Model\\EditableFormField\\EditableFileField','SilverStripe\\UserForms\\Model\\EditableFormField\\EditableFormHeading','SilverStripe\\UserForms\\Model\\EditableFormField\\EditableFormStep','SilverStripe\\UserForms\\Model\\EditableFormField\\EditableLiteralField','SilverStripe\\UserForms\\Model\\EditableFormField\\EditableMemberListField','SilverStripe\\UserForms\\Model\\EditableFormField\\EditableMultipleOptionField','SilverStripe\\UserForms\\Model\\EditableFormField\\EditableNumericField','SilverStripe\\UserForms\\Model\\EditableFormField\\EditableTextField','SilverStripe\\UserForms\\Model\\EditableFormField\\EditableCheckboxGroupField','SilverStripe\\UserForms\\Model\\EditableFormField\\EditableDropdown','SilverStripe\\UserForms\\Model\\EditableFormField\\EditableRadioField','SilverStripe\\UserForms\\Model\\Submission\\SubmittedFileField') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'SilverStripe\\Assets\\File'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `File_EditorGroups`
--

CREATE TABLE `File_EditorGroups` (
  `ID` int(11) NOT NULL,
  `FileID` int(11) NOT NULL DEFAULT 0,
  `GroupID` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `File_EditorMembers`
--

CREATE TABLE `File_EditorMembers` (
  `ID` int(11) NOT NULL,
  `FileID` int(11) NOT NULL DEFAULT 0,
  `MemberID` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `File_Live`
--

CREATE TABLE `File_Live` (
  `ID` int(11) NOT NULL,
  `ClassName` enum('SilverStripe\\Assets\\File','SilverStripe\\Assets\\Folder','SilverStripe\\Assets\\Image') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'SilverStripe\\Assets\\File',
  `LastEdited` datetime DEFAULT NULL,
  `Created` datetime DEFAULT NULL,
  `Version` int(11) NOT NULL DEFAULT 0,
  `UserFormUpload` enum('f','t') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CanViewType` enum('Anyone','LoggedInUsers','OnlyTheseUsers','OnlyTheseMembers','Inherit') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'Inherit',
  `CanEditType` enum('LoggedInUsers','OnlyTheseUsers','OnlyTheseMembers','Inherit') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'Inherit',
  `Name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ShowInSearch` tinyint(1) UNSIGNED NOT NULL DEFAULT 1,
  `ParentID` int(11) NOT NULL DEFAULT 0,
  `OwnerID` int(11) NOT NULL DEFAULT 0,
  `FileHash` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `FileFilename` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `FileVariant` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `File_Versions`
--

CREATE TABLE `File_Versions` (
  `ID` int(11) NOT NULL,
  `RecordID` int(11) NOT NULL DEFAULT 0,
  `Version` int(11) NOT NULL DEFAULT 0,
  `WasPublished` tinyint(1) UNSIGNED NOT NULL DEFAULT 0,
  `WasDeleted` tinyint(1) UNSIGNED NOT NULL DEFAULT 0,
  `WasDraft` tinyint(1) UNSIGNED NOT NULL DEFAULT 1,
  `AuthorID` int(11) NOT NULL DEFAULT 0,
  `PublisherID` int(11) NOT NULL DEFAULT 0,
  `ClassName` enum('SilverStripe\\Assets\\File','SilverStripe\\Assets\\Folder','SilverStripe\\Assets\\Image') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'SilverStripe\\Assets\\File',
  `LastEdited` datetime DEFAULT NULL,
  `Created` datetime DEFAULT NULL,
  `UserFormUpload` enum('f','t') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CanViewType` enum('Anyone','LoggedInUsers','OnlyTheseUsers','OnlyTheseMembers','Inherit') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'Inherit',
  `CanEditType` enum('LoggedInUsers','OnlyTheseUsers','OnlyTheseMembers','Inherit') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'Inherit',
  `Name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ShowInSearch` tinyint(1) UNSIGNED NOT NULL DEFAULT 1,
  `ParentID` int(11) NOT NULL DEFAULT 0,
  `OwnerID` int(11) NOT NULL DEFAULT 0,
  `FileHash` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `FileFilename` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `FileVariant` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `File_ViewerGroups`
--

CREATE TABLE `File_ViewerGroups` (
  `ID` int(11) NOT NULL,
  `FileID` int(11) NOT NULL DEFAULT 0,
  `GroupID` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `File_ViewerMembers`
--

CREATE TABLE `File_ViewerMembers` (
  `ID` int(11) NOT NULL,
  `FileID` int(11) NOT NULL DEFAULT 0,
  `MemberID` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `Fluent_Domain`
--

CREATE TABLE `Fluent_Domain` (
  `ID` int(11) NOT NULL,
  `ClassName` enum('TractorCow\\Fluent\\Model\\Domain') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'TractorCow\\Fluent\\Model\\Domain',
  `LastEdited` datetime DEFAULT NULL,
  `Created` datetime DEFAULT NULL,
  `Domain` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `DefaultLocaleID` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `Fluent_FallbackLocale`
--

CREATE TABLE `Fluent_FallbackLocale` (
  `ID` int(11) NOT NULL,
  `ClassName` enum('TractorCow\\Fluent\\Model\\FallbackLocale') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'TractorCow\\Fluent\\Model\\FallbackLocale',
  `LastEdited` datetime DEFAULT NULL,
  `Created` datetime DEFAULT NULL,
  `Sort` int(11) NOT NULL DEFAULT 0,
  `ParentID` int(11) NOT NULL DEFAULT 0,
  `LocaleID` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `Fluent_Locale`
--

CREATE TABLE `Fluent_Locale` (
  `ID` int(11) NOT NULL,
  `ClassName` enum('TractorCow\\Fluent\\Model\\Locale') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'TractorCow\\Fluent\\Model\\Locale',
  `LastEdited` datetime DEFAULT NULL,
  `Created` datetime DEFAULT NULL,
  `Title` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Locale` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `URLSegment` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `IsGlobalDefault` tinyint(1) UNSIGNED NOT NULL DEFAULT 0,
  `UseDefaultCode` tinyint(1) UNSIGNED NOT NULL DEFAULT 0,
  `Sort` int(11) NOT NULL DEFAULT 0,
  `Timezone` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `DomainID` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Daten für Tabelle `Fluent_Locale`
--

INSERT INTO `Fluent_Locale` (`ID`, `ClassName`, `LastEdited`, `Created`, `Title`, `Locale`, `URLSegment`, `IsGlobalDefault`, `UseDefaultCode`, `Sort`, `Timezone`, `DomainID`) VALUES
(1, 'TractorCow\\Fluent\\Model\\Locale', '2025-06-23 14:15:47', '2025-06-23 14:14:39', 'DE', 'de_CH', 'de', 1, 0, 0, 'Europe/Zurich', 0),
(2, 'TractorCow\\Fluent\\Model\\Locale', '2025-06-23 14:15:36', '2025-06-23 14:15:36', 'EN', 'en_US', 'en', 0, 0, 0, 'Europe/Zurich', 0);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `Group`
--

CREATE TABLE `Group` (
  `ID` int(11) NOT NULL,
  `ClassName` enum('SilverStripe\\Security\\Group') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'SilverStripe\\Security\\Group',
  `LastEdited` datetime DEFAULT NULL,
  `Created` datetime DEFAULT NULL,
  `Title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Description` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Locked` tinyint(1) UNSIGNED NOT NULL DEFAULT 0,
  `Sort` int(11) NOT NULL DEFAULT 0,
  `HtmlEditorConfig` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ParentID` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Daten für Tabelle `Group`
--

INSERT INTO `Group` (`ID`, `ClassName`, `LastEdited`, `Created`, `Title`, `Description`, `Code`, `Locked`, `Sort`, `HtmlEditorConfig`, `ParentID`) VALUES
(1, 'SilverStripe\\Security\\Group', '2025-06-23 14:13:32', '2025-06-23 14:13:32', 'Inhaltsautoren', NULL, 'content-authors', 0, 1, NULL, 0),
(2, 'SilverStripe\\Security\\Group', '2025-06-23 14:13:32', '2025-06-23 14:13:32', 'Administratoren', NULL, 'administrators', 0, 0, NULL, 0);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `Group_Members`
--

CREATE TABLE `Group_Members` (
  `ID` int(11) NOT NULL,
  `GroupID` int(11) NOT NULL DEFAULT 0,
  `MemberID` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Daten für Tabelle `Group_Members`
--

INSERT INTO `Group_Members` (`ID`, `GroupID`, `MemberID`) VALUES
(1, 2, 1);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `Group_Roles`
--

CREATE TABLE `Group_Roles` (
  `ID` int(11) NOT NULL,
  `GroupID` int(11) NOT NULL DEFAULT 0,
  `PermissionRoleID` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `Image`
--

CREATE TABLE `Image` (
  `ID` int(11) NOT NULL,
  `FocusPointX` double DEFAULT NULL,
  `FocusPointY` double DEFAULT NULL,
  `FocusPointWidth` int(11) NOT NULL DEFAULT 0,
  `FocusPointHeight` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `Image_Live`
--

CREATE TABLE `Image_Live` (
  `ID` int(11) NOT NULL,
  `FocusPointX` double DEFAULT NULL,
  `FocusPointY` double DEFAULT NULL,
  `FocusPointWidth` int(11) NOT NULL DEFAULT 0,
  `FocusPointHeight` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `Image_Versions`
--

CREATE TABLE `Image_Versions` (
  `ID` int(11) NOT NULL,
  `RecordID` int(11) NOT NULL DEFAULT 0,
  `Version` int(11) NOT NULL DEFAULT 0,
  `FocusPointX` double DEFAULT NULL,
  `FocusPointY` double DEFAULT NULL,
  `FocusPointWidth` int(11) NOT NULL DEFAULT 0,
  `FocusPointHeight` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `LoginAttempt`
--

CREATE TABLE `LoginAttempt` (
  `ID` int(11) NOT NULL,
  `ClassName` enum('SilverStripe\\Security\\LoginAttempt') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'SilverStripe\\Security\\LoginAttempt',
  `LastEdited` datetime DEFAULT NULL,
  `Created` datetime DEFAULT NULL,
  `EmailHashed` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Status` enum('Success','Failure') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'Success',
  `IP` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `MemberID` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `Member`
--

CREATE TABLE `Member` (
  `ID` int(11) NOT NULL,
  `ClassName` enum('SilverStripe\\Security\\Member') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'SilverStripe\\Security\\Member',
  `LastEdited` datetime DEFAULT NULL,
  `Created` datetime DEFAULT NULL,
  `URLSegment` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `BlogProfileSummary` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `FirstName` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Surname` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Email` varchar(254) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `TempIDHash` varchar(160) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `TempIDExpired` datetime DEFAULT NULL,
  `Password` varchar(160) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `AutoLoginHash` varchar(160) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `AutoLoginExpired` datetime DEFAULT NULL,
  `PasswordEncryption` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Salt` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `PasswordExpiry` date DEFAULT NULL,
  `LockedOutUntil` datetime DEFAULT NULL,
  `Locale` varchar(6) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `FailedLoginCount` int(11) NOT NULL DEFAULT 0,
  `BlogProfileImageID` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Daten für Tabelle `Member`
--

INSERT INTO `Member` (`ID`, `ClassName`, `LastEdited`, `Created`, `URLSegment`, `BlogProfileSummary`, `FirstName`, `Surname`, `Email`, `TempIDHash`, `TempIDExpired`, `Password`, `AutoLoginHash`, `AutoLoginExpired`, `PasswordEncryption`, `Salt`, `PasswordExpiry`, `LockedOutUntil`, `Locale`, `FailedLoginCount`, `BlogProfileImageID`) VALUES
(1, 'SilverStripe\\Security\\Member', '2025-06-23 14:13:33', '2025-06-23 14:13:33', 'standardadmin', NULL, 'Standardadmin', NULL, 'admin', NULL, NULL, '$2y$10$3f42a611f64ad6ea87b6euOST3VXalKlWTyqwjK2cta954uJQ7UJa', NULL, NULL, 'blowfish', '10$3f42a611f64ad6ea87b6e8', NULL, NULL, 'de_CH', 0, 0);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `MemberPassword`
--

CREATE TABLE `MemberPassword` (
  `ID` int(11) NOT NULL,
  `ClassName` enum('SilverStripe\\Security\\MemberPassword') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'SilverStripe\\Security\\MemberPassword',
  `LastEdited` datetime DEFAULT NULL,
  `Created` datetime DEFAULT NULL,
  `Password` varchar(160) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Salt` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `PasswordEncryption` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `MemberID` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Daten für Tabelle `MemberPassword`
--

INSERT INTO `MemberPassword` (`ID`, `ClassName`, `LastEdited`, `Created`, `Password`, `Salt`, `PasswordEncryption`, `MemberID`) VALUES
(1, 'SilverStripe\\Security\\MemberPassword', '2025-06-23 14:13:33', '2025-06-23 14:13:33', '$2y$10$3f42a611f64ad6ea87b6euOST3VXalKlWTyqwjK2cta954uJQ7UJa', '10$3f42a611f64ad6ea87b6e8', 'blowfish', 1);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `Page_PageCategories`
--

CREATE TABLE `Page_PageCategories` (
  `ID` int(11) NOT NULL,
  `PageID` int(11) NOT NULL DEFAULT 0,
  `BlogCategoryID` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `Permission`
--

CREATE TABLE `Permission` (
  `ID` int(11) NOT NULL,
  `ClassName` enum('SilverStripe\\Security\\Permission') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'SilverStripe\\Security\\Permission',
  `LastEdited` datetime DEFAULT NULL,
  `Created` datetime DEFAULT NULL,
  `Code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Arg` int(11) NOT NULL DEFAULT 0,
  `Type` int(11) NOT NULL DEFAULT 1,
  `GroupID` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Daten für Tabelle `Permission`
--

INSERT INTO `Permission` (`ID`, `ClassName`, `LastEdited`, `Created`, `Code`, `Arg`, `Type`, `GroupID`) VALUES
(1, 'SilverStripe\\Security\\Permission', '2025-06-23 14:13:32', '2025-06-23 14:13:32', 'CMS_ACCESS_CMSMain', 0, 1, 1),
(2, 'SilverStripe\\Security\\Permission', '2025-06-23 14:13:32', '2025-06-23 14:13:32', 'CMS_ACCESS_AssetAdmin', 0, 1, 1),
(3, 'SilverStripe\\Security\\Permission', '2025-06-23 14:13:32', '2025-06-23 14:13:32', 'CMS_ACCESS_ReportAdmin', 0, 1, 1),
(4, 'SilverStripe\\Security\\Permission', '2025-06-23 14:13:32', '2025-06-23 14:13:32', 'SITETREE_REORGANISE', 0, 1, 1),
(5, 'SilverStripe\\Security\\Permission', '2025-06-23 14:13:33', '2025-06-23 14:13:33', 'ADMIN', 0, 1, 2);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `PermissionRole`
--

CREATE TABLE `PermissionRole` (
  `ID` int(11) NOT NULL,
  `ClassName` enum('SilverStripe\\Security\\PermissionRole') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'SilverStripe\\Security\\PermissionRole',
  `LastEdited` datetime DEFAULT NULL,
  `Created` datetime DEFAULT NULL,
  `Title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `OnlyAdminCanApply` tinyint(1) UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `PermissionRoleCode`
--

CREATE TABLE `PermissionRoleCode` (
  `ID` int(11) NOT NULL,
  `ClassName` enum('SilverStripe\\Security\\PermissionRoleCode') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'SilverStripe\\Security\\PermissionRoleCode',
  `LastEdited` datetime DEFAULT NULL,
  `Created` datetime DEFAULT NULL,
  `Code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `RoleID` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `RedirectorPage`
--

CREATE TABLE `RedirectorPage` (
  `ID` int(11) NOT NULL,
  `RedirectionType` enum('Internal','External','File') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'Internal',
  `ExternalURL` varchar(2083) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `LinkToID` int(11) NOT NULL DEFAULT 0,
  `LinkToFileID` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `RedirectorPage_Live`
--

CREATE TABLE `RedirectorPage_Live` (
  `ID` int(11) NOT NULL,
  `RedirectionType` enum('Internal','External','File') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'Internal',
  `ExternalURL` varchar(2083) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `LinkToID` int(11) NOT NULL DEFAULT 0,
  `LinkToFileID` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `RedirectorPage_Localised`
--

CREATE TABLE `RedirectorPage_Localised` (
  `ID` int(11) NOT NULL,
  `RecordID` int(11) NOT NULL DEFAULT 0,
  `Locale` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ExternalURL` varchar(2083) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `RedirectorPage_Localised_Live`
--

CREATE TABLE `RedirectorPage_Localised_Live` (
  `ID` int(11) NOT NULL,
  `RecordID` int(11) NOT NULL DEFAULT 0,
  `Locale` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ExternalURL` varchar(2083) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `RedirectorPage_Localised_Versions`
--

CREATE TABLE `RedirectorPage_Localised_Versions` (
  `Version` int(11) NOT NULL DEFAULT 0,
  `ID` int(11) NOT NULL,
  `RecordID` int(11) NOT NULL DEFAULT 0,
  `Locale` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ExternalURL` varchar(2083) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `RedirectorPage_Versions`
--

CREATE TABLE `RedirectorPage_Versions` (
  `ID` int(11) NOT NULL,
  `RecordID` int(11) NOT NULL DEFAULT 0,
  `Version` int(11) NOT NULL DEFAULT 0,
  `RedirectionType` enum('Internal','External','File') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'Internal',
  `ExternalURL` varchar(2083) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `LinkToID` int(11) NOT NULL DEFAULT 0,
  `LinkToFileID` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `RememberLoginHash`
--

CREATE TABLE `RememberLoginHash` (
  `ID` int(11) NOT NULL,
  `ClassName` enum('SilverStripe\\Security\\RememberLoginHash') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'SilverStripe\\Security\\RememberLoginHash',
  `LastEdited` datetime DEFAULT NULL,
  `Created` datetime DEFAULT NULL,
  `DeviceID` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Hash` varchar(160) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ExpiryDate` datetime DEFAULT NULL,
  `MemberID` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `SiteConfig`
--

CREATE TABLE `SiteConfig` (
  `ID` int(11) NOT NULL,
  `ClassName` enum('SilverStripe\\SiteConfig\\SiteConfig') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'SilverStripe\\SiteConfig\\SiteConfig',
  `LastEdited` datetime DEFAULT NULL,
  `Created` datetime DEFAULT NULL,
  `Title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Tagline` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CanViewType` enum('Anyone','LoggedInUsers','OnlyTheseUsers','OnlyTheseMembers') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'Anyone',
  `CanEditType` enum('LoggedInUsers','OnlyTheseUsers','OnlyTheseMembers') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'LoggedInUsers',
  `CanCreateTopLevelType` enum('LoggedInUsers','OnlyTheseUsers','OnlyTheseMembers') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'LoggedInUsers'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Daten für Tabelle `SiteConfig`
--

INSERT INTO `SiteConfig` (`ID`, `ClassName`, `LastEdited`, `Created`, `Title`, `Tagline`, `CanViewType`, `CanEditType`, `CanCreateTopLevelType`) VALUES
(1, 'SilverStripe\\SiteConfig\\SiteConfig', '2025-06-23 14:13:32', '2025-06-23 14:13:32', 'Name Webseite', 'Dein Slogan', 'Anyone', 'LoggedInUsers', 'LoggedInUsers');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `SiteConfig_CreateTopLevelGroups`
--

CREATE TABLE `SiteConfig_CreateTopLevelGroups` (
  `ID` int(11) NOT NULL,
  `SiteConfigID` int(11) NOT NULL DEFAULT 0,
  `GroupID` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `SiteConfig_CreateTopLevelMembers`
--

CREATE TABLE `SiteConfig_CreateTopLevelMembers` (
  `ID` int(11) NOT NULL,
  `SiteConfigID` int(11) NOT NULL DEFAULT 0,
  `MemberID` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `SiteConfig_EditorGroups`
--

CREATE TABLE `SiteConfig_EditorGroups` (
  `ID` int(11) NOT NULL,
  `SiteConfigID` int(11) NOT NULL DEFAULT 0,
  `GroupID` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `SiteConfig_EditorMembers`
--

CREATE TABLE `SiteConfig_EditorMembers` (
  `ID` int(11) NOT NULL,
  `SiteConfigID` int(11) NOT NULL DEFAULT 0,
  `MemberID` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `SiteConfig_Localised`
--

CREATE TABLE `SiteConfig_Localised` (
  `ID` int(11) NOT NULL,
  `RecordID` int(11) NOT NULL DEFAULT 0,
  `Locale` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Tagline` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `SiteConfig_ViewerGroups`
--

CREATE TABLE `SiteConfig_ViewerGroups` (
  `ID` int(11) NOT NULL,
  `SiteConfigID` int(11) NOT NULL DEFAULT 0,
  `GroupID` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `SiteConfig_ViewerMembers`
--

CREATE TABLE `SiteConfig_ViewerMembers` (
  `ID` int(11) NOT NULL,
  `SiteConfigID` int(11) NOT NULL DEFAULT 0,
  `MemberID` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `SiteTree`
--

CREATE TABLE `SiteTree` (
  `ID` int(11) NOT NULL,
  `ClassName` enum('SilverStripe\\CMS\\Model\\SiteTree','Page','App\\Models\\ElementPage','SilverStripe\\Blog\\Model\\Blog','SilverStripe\\Blog\\Model\\BlogPost','SilverStripe\\CMS\\Model\\RedirectorPage','SilverStripe\\CMS\\Model\\VirtualPage','SilverStripe\\UserForms\\Model\\UserDefinedForm') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'App\\Models\\ElementPage',
  `LastEdited` datetime DEFAULT NULL,
  `Created` datetime DEFAULT NULL,
  `Priority` varchar(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CanViewType` enum('Anyone','LoggedInUsers','OnlyTheseUsers','OnlyTheseMembers','Inherit') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'Inherit',
  `CanEditType` enum('LoggedInUsers','OnlyTheseUsers','OnlyTheseMembers','Inherit') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'Inherit',
  `Version` int(11) NOT NULL DEFAULT 0,
  `URLSegment` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `MenuTitle` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Content` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `MetaDescription` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ExtraMeta` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ShowInMenus` tinyint(1) UNSIGNED NOT NULL DEFAULT 0,
  `ShowInSearch` tinyint(1) UNSIGNED NOT NULL DEFAULT 0,
  `Sort` int(11) NOT NULL DEFAULT 0,
  `HasBrokenFile` tinyint(1) UNSIGNED NOT NULL DEFAULT 0,
  `HasBrokenLink` tinyint(1) UNSIGNED NOT NULL DEFAULT 0,
  `ReportClass` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ParentID` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Daten für Tabelle `SiteTree`
--

INSERT INTO `SiteTree` (`ID`, `ClassName`, `LastEdited`, `Created`, `Priority`, `CanViewType`, `CanEditType`, `Version`, `URLSegment`, `Title`, `MenuTitle`, `Content`, `MetaDescription`, `ExtraMeta`, `ShowInMenus`, `ShowInSearch`, `Sort`, `HasBrokenFile`, `HasBrokenLink`, `ReportClass`, `ParentID`) VALUES
(1, 'App\\Models\\ElementPage', '2025-06-23 14:24:07', '2025-06-23 14:15:56', NULL, 'Inherit', 'Inherit', 6, 'home', 'Home', NULL, NULL, NULL, NULL, 1, 1, 1, 0, 0, NULL, 0);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `SiteTreeLink`
--

CREATE TABLE `SiteTreeLink` (
  `ID` int(11) NOT NULL,
  `ClassName` enum('SilverStripe\\CMS\\Model\\SiteTreeLink') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'SilverStripe\\CMS\\Model\\SiteTreeLink',
  `LastEdited` datetime DEFAULT NULL,
  `Created` datetime DEFAULT NULL,
  `LinkedID` int(11) NOT NULL DEFAULT 0,
  `ParentID` int(11) NOT NULL DEFAULT 0,
  `ParentClass` enum('SilverStripe\\Assets\\File','SilverStripe\\SiteConfig\\SiteConfig','SilverStripe\\Versioned\\ChangeSet','SilverStripe\\Versioned\\ChangeSetItem','DNADesign\\Elemental\\Models\\BaseElement','DNADesign\\Elemental\\Models\\ElementalArea','SilverStripe\\Assets\\Shortcodes\\FileLink','SilverStripe\\Blog\\Model\\BlogCategory','SilverStripe\\Blog\\Model\\BlogTag','SilverStripe\\CMS\\Model\\SiteTree','SilverStripe\\CMS\\Model\\SiteTreeLink','SilverStripe\\Security\\Group','SilverStripe\\Security\\LoginAttempt','SilverStripe\\Security\\Member','SilverStripe\\Security\\MemberPassword','SilverStripe\\Security\\Permission','SilverStripe\\Security\\PermissionRole','SilverStripe\\Security\\PermissionRoleCode','SilverStripe\\Security\\RememberLoginHash','SilverStripe\\UserForms\\Model\\EditableCustomRule','SilverStripe\\UserForms\\Model\\EditableFormField','TractorCow\\Fluent\\Model\\Domain','TractorCow\\Fluent\\Model\\FallbackLocale','TractorCow\\Fluent\\Model\\Locale','SilverStripe\\UserForms\\Model\\EditableFormField\\EditableOption','SilverStripe\\UserForms\\Model\\Recipient\\EmailRecipient','SilverStripe\\UserForms\\Model\\Recipient\\EmailRecipientCondition','SilverStripe\\UserForms\\Model\\Submission\\SubmittedForm','SilverStripe\\UserForms\\Model\\Submission\\SubmittedFormField','SilverStripe\\Assets\\Folder','SilverStripe\\Assets\\Image','DNADesign\\Elemental\\Models\\ElementContent','DNADesign\\ElementalUserForms\\Model\\ElementForm','DNADesign\\ElementalVirtual\\Model\\ElementVirtual','Page','App\\Models\\ElementPage','SilverStripe\\Blog\\Model\\Blog','SilverStripe\\Blog\\Model\\BlogPost','SilverStripe\\CMS\\Model\\RedirectorPage','SilverStripe\\CMS\\Model\\VirtualPage','SilverStripe\\UserForms\\Model\\UserDefinedForm','App\\Models\\EditableFormField\\EditableCheckboxTerms','SilverStripe\\UserForms\\Model\\EditableFormField\\EditableCheckbox','SilverStripe\\UserForms\\Model\\EditableFormField\\EditableCountryDropdownField','SilverStripe\\UserForms\\Model\\EditableFormField\\EditableDateField','SilverStripe\\UserForms\\Model\\EditableFormField\\EditableEmailField','SilverStripe\\UserForms\\Model\\EditableFormField\\EditableFieldGroup','SilverStripe\\UserForms\\Model\\EditableFormField\\EditableFieldGroupEnd','SilverStripe\\UserForms\\Model\\EditableFormField\\EditableFileField','SilverStripe\\UserForms\\Model\\EditableFormField\\EditableFormHeading','SilverStripe\\UserForms\\Model\\EditableFormField\\EditableFormStep','SilverStripe\\UserForms\\Model\\EditableFormField\\EditableLiteralField','SilverStripe\\UserForms\\Model\\EditableFormField\\EditableMemberListField','SilverStripe\\UserForms\\Model\\EditableFormField\\EditableMultipleOptionField','SilverStripe\\UserForms\\Model\\EditableFormField\\EditableNumericField','SilverStripe\\UserForms\\Model\\EditableFormField\\EditableTextField','SilverStripe\\UserForms\\Model\\EditableFormField\\EditableCheckboxGroupField','SilverStripe\\UserForms\\Model\\EditableFormField\\EditableDropdown','SilverStripe\\UserForms\\Model\\EditableFormField\\EditableRadioField','SilverStripe\\UserForms\\Model\\Submission\\SubmittedFileField') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'SilverStripe\\Assets\\File'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `SiteTree_EditorGroups`
--

CREATE TABLE `SiteTree_EditorGroups` (
  `ID` int(11) NOT NULL,
  `SiteTreeID` int(11) NOT NULL DEFAULT 0,
  `GroupID` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `SiteTree_EditorMembers`
--

CREATE TABLE `SiteTree_EditorMembers` (
  `ID` int(11) NOT NULL,
  `SiteTreeID` int(11) NOT NULL DEFAULT 0,
  `MemberID` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `SiteTree_Live`
--

CREATE TABLE `SiteTree_Live` (
  `ID` int(11) NOT NULL,
  `ClassName` enum('SilverStripe\\CMS\\Model\\SiteTree','Page','App\\Models\\ElementPage','SilverStripe\\Blog\\Model\\Blog','SilverStripe\\Blog\\Model\\BlogPost','SilverStripe\\CMS\\Model\\RedirectorPage','SilverStripe\\CMS\\Model\\VirtualPage','SilverStripe\\UserForms\\Model\\UserDefinedForm') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'App\\Models\\ElementPage',
  `LastEdited` datetime DEFAULT NULL,
  `Created` datetime DEFAULT NULL,
  `Priority` varchar(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CanViewType` enum('Anyone','LoggedInUsers','OnlyTheseUsers','OnlyTheseMembers','Inherit') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'Inherit',
  `CanEditType` enum('LoggedInUsers','OnlyTheseUsers','OnlyTheseMembers','Inherit') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'Inherit',
  `Version` int(11) NOT NULL DEFAULT 0,
  `URLSegment` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `MenuTitle` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Content` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `MetaDescription` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ExtraMeta` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ShowInMenus` tinyint(1) UNSIGNED NOT NULL DEFAULT 0,
  `ShowInSearch` tinyint(1) UNSIGNED NOT NULL DEFAULT 0,
  `Sort` int(11) NOT NULL DEFAULT 0,
  `HasBrokenFile` tinyint(1) UNSIGNED NOT NULL DEFAULT 0,
  `HasBrokenLink` tinyint(1) UNSIGNED NOT NULL DEFAULT 0,
  `ReportClass` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ParentID` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Daten für Tabelle `SiteTree_Live`
--

INSERT INTO `SiteTree_Live` (`ID`, `ClassName`, `LastEdited`, `Created`, `Priority`, `CanViewType`, `CanEditType`, `Version`, `URLSegment`, `Title`, `MenuTitle`, `Content`, `MetaDescription`, `ExtraMeta`, `ShowInMenus`, `ShowInSearch`, `Sort`, `HasBrokenFile`, `HasBrokenLink`, `ReportClass`, `ParentID`) VALUES
(1, 'App\\Models\\ElementPage', '2025-06-23 14:24:07', '2025-06-23 14:15:56', NULL, 'Inherit', 'Inherit', 6, 'home', 'Home', NULL, NULL, NULL, NULL, 1, 1, 1, 0, 0, NULL, 0);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `SiteTree_Localised`
--

CREATE TABLE `SiteTree_Localised` (
  `ID` int(11) NOT NULL,
  `RecordID` int(11) NOT NULL DEFAULT 0,
  `Locale` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `URLSegment` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `MenuTitle` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Content` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `MetaDescription` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ReportClass` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Daten für Tabelle `SiteTree_Localised`
--

INSERT INTO `SiteTree_Localised` (`ID`, `RecordID`, `Locale`, `URLSegment`, `Title`, `MenuTitle`, `Content`, `MetaDescription`, `ReportClass`) VALUES
(1, 1, 'de_CH', 'home', 'Home', NULL, NULL, NULL, NULL),
(2, 1, 'en_US', 'home', 'Home', NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `SiteTree_Localised_Live`
--

CREATE TABLE `SiteTree_Localised_Live` (
  `ID` int(11) NOT NULL,
  `RecordID` int(11) NOT NULL DEFAULT 0,
  `Locale` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `URLSegment` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `MenuTitle` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Content` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `MetaDescription` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ReportClass` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Daten für Tabelle `SiteTree_Localised_Live`
--

INSERT INTO `SiteTree_Localised_Live` (`ID`, `RecordID`, `Locale`, `URLSegment`, `Title`, `MenuTitle`, `Content`, `MetaDescription`, `ReportClass`) VALUES
(1, 1, 'de_CH', 'home', 'Home', NULL, NULL, NULL, NULL),
(2, 1, 'en_US', 'home', 'Home', NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `SiteTree_Localised_Versions`
--

CREATE TABLE `SiteTree_Localised_Versions` (
  `Version` int(11) NOT NULL DEFAULT 0,
  `ID` int(11) NOT NULL,
  `RecordID` int(11) NOT NULL DEFAULT 0,
  `Locale` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `URLSegment` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `MenuTitle` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Content` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `MetaDescription` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ReportClass` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Daten für Tabelle `SiteTree_Localised_Versions`
--

INSERT INTO `SiteTree_Localised_Versions` (`Version`, `ID`, `RecordID`, `Locale`, `URLSegment`, `Title`, `MenuTitle`, `Content`, `MetaDescription`, `ReportClass`) VALUES
(1, 1, 1, 'de_CH', 'neue-element-page', 'Neue Element Page', NULL, NULL, NULL, NULL),
(2, 2, 1, 'de_CH', 'home', 'Home', NULL, NULL, NULL, NULL),
(3, 3, 1, 'de_CH', 'home', 'Home', NULL, NULL, NULL, NULL),
(4, 4, 1, 'en_US', 'home', 'Home', NULL, NULL, NULL, NULL),
(5, 5, 1, 'en_US', 'home', 'Home', NULL, NULL, NULL, NULL),
(6, 6, 1, 'en_US', 'home', 'Home', NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `SiteTree_Versions`
--

CREATE TABLE `SiteTree_Versions` (
  `ID` int(11) NOT NULL,
  `RecordID` int(11) NOT NULL DEFAULT 0,
  `Version` int(11) NOT NULL DEFAULT 0,
  `WasPublished` tinyint(1) UNSIGNED NOT NULL DEFAULT 0,
  `WasDeleted` tinyint(1) UNSIGNED NOT NULL DEFAULT 0,
  `WasDraft` tinyint(1) UNSIGNED NOT NULL DEFAULT 1,
  `AuthorID` int(11) NOT NULL DEFAULT 0,
  `PublisherID` int(11) NOT NULL DEFAULT 0,
  `ClassName` enum('SilverStripe\\CMS\\Model\\SiteTree','Page','App\\Models\\ElementPage','SilverStripe\\Blog\\Model\\Blog','SilverStripe\\Blog\\Model\\BlogPost','SilverStripe\\CMS\\Model\\RedirectorPage','SilverStripe\\CMS\\Model\\VirtualPage','SilverStripe\\UserForms\\Model\\UserDefinedForm') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'App\\Models\\ElementPage',
  `LastEdited` datetime DEFAULT NULL,
  `Created` datetime DEFAULT NULL,
  `Priority` varchar(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CanViewType` enum('Anyone','LoggedInUsers','OnlyTheseUsers','OnlyTheseMembers','Inherit') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'Inherit',
  `CanEditType` enum('LoggedInUsers','OnlyTheseUsers','OnlyTheseMembers','Inherit') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'Inherit',
  `URLSegment` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `MenuTitle` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Content` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `MetaDescription` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ExtraMeta` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ShowInMenus` tinyint(1) UNSIGNED NOT NULL DEFAULT 0,
  `ShowInSearch` tinyint(1) UNSIGNED NOT NULL DEFAULT 0,
  `Sort` int(11) NOT NULL DEFAULT 0,
  `HasBrokenFile` tinyint(1) UNSIGNED NOT NULL DEFAULT 0,
  `HasBrokenLink` tinyint(1) UNSIGNED NOT NULL DEFAULT 0,
  `ReportClass` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ParentID` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Daten für Tabelle `SiteTree_Versions`
--

INSERT INTO `SiteTree_Versions` (`ID`, `RecordID`, `Version`, `WasPublished`, `WasDeleted`, `WasDraft`, `AuthorID`, `PublisherID`, `ClassName`, `LastEdited`, `Created`, `Priority`, `CanViewType`, `CanEditType`, `URLSegment`, `Title`, `MenuTitle`, `Content`, `MetaDescription`, `ExtraMeta`, `ShowInMenus`, `ShowInSearch`, `Sort`, `HasBrokenFile`, `HasBrokenLink`, `ReportClass`, `ParentID`) VALUES
(1, 1, 1, 0, 0, 1, 1, 0, 'App\\Models\\ElementPage', '2025-06-23 14:15:56', '2025-06-23 14:15:56', NULL, 'Inherit', 'Inherit', 'neue-element-page', 'Neue Element Page', NULL, NULL, NULL, NULL, 1, 1, 1, 0, 0, NULL, 0),
(2, 1, 2, 0, 0, 1, 1, 0, 'App\\Models\\ElementPage', '2025-06-23 14:16:11', '2025-06-23 14:15:56', NULL, 'Inherit', 'Inherit', 'home', 'Home', NULL, NULL, NULL, NULL, 1, 1, 1, 0, 0, NULL, 0),
(3, 1, 3, 1, 0, 1, 1, 1, 'App\\Models\\ElementPage', '2025-06-23 14:21:30', '2025-06-23 14:15:56', NULL, 'Inherit', 'Inherit', 'home', 'Home', NULL, NULL, NULL, NULL, 1, 1, 1, 0, 0, NULL, 0),
(4, 1, 4, 0, 0, 1, 1, 0, 'App\\Models\\ElementPage', '2025-06-23 14:22:02', '2025-06-23 14:15:56', NULL, 'Inherit', 'Inherit', 'home', 'Home', NULL, NULL, NULL, NULL, 1, 1, 1, 0, 0, NULL, 0),
(5, 1, 5, 1, 0, 1, 1, 1, 'App\\Models\\ElementPage', '2025-06-23 14:22:02', '2025-06-23 14:15:56', NULL, 'Inherit', 'Inherit', 'home', 'Home', NULL, NULL, NULL, NULL, 1, 1, 1, 0, 0, NULL, 0),
(6, 1, 6, 1, 0, 1, 1, 1, 'App\\Models\\ElementPage', '2025-06-23 14:24:07', '2025-06-23 14:15:56', NULL, 'Inherit', 'Inherit', 'home', 'Home', NULL, NULL, NULL, NULL, 1, 1, 1, 0, 0, NULL, 0);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `SiteTree_ViewerGroups`
--

CREATE TABLE `SiteTree_ViewerGroups` (
  `ID` int(11) NOT NULL,
  `SiteTreeID` int(11) NOT NULL DEFAULT 0,
  `GroupID` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `SiteTree_ViewerMembers`
--

CREATE TABLE `SiteTree_ViewerMembers` (
  `ID` int(11) NOT NULL,
  `SiteTreeID` int(11) NOT NULL DEFAULT 0,
  `MemberID` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `SubmittedFileField`
--

CREATE TABLE `SubmittedFileField` (
  `ID` int(11) NOT NULL,
  `UploadedFileID` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `SubmittedForm`
--

CREATE TABLE `SubmittedForm` (
  `ID` int(11) NOT NULL,
  `ClassName` enum('SilverStripe\\UserForms\\Model\\Submission\\SubmittedForm') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'SilverStripe\\UserForms\\Model\\Submission\\SubmittedForm',
  `LastEdited` datetime DEFAULT NULL,
  `Created` datetime DEFAULT NULL,
  `SubmittedByID` int(11) NOT NULL DEFAULT 0,
  `ParentID` int(11) NOT NULL DEFAULT 0,
  `ParentClass` enum('SilverStripe\\Assets\\File','SilverStripe\\SiteConfig\\SiteConfig','SilverStripe\\Versioned\\ChangeSet','SilverStripe\\Versioned\\ChangeSetItem','DNADesign\\Elemental\\Models\\BaseElement','DNADesign\\Elemental\\Models\\ElementalArea','SilverStripe\\Assets\\Shortcodes\\FileLink','SilverStripe\\Blog\\Model\\BlogCategory','SilverStripe\\Blog\\Model\\BlogTag','SilverStripe\\CMS\\Model\\SiteTree','SilverStripe\\CMS\\Model\\SiteTreeLink','SilverStripe\\Security\\Group','SilverStripe\\Security\\LoginAttempt','SilverStripe\\Security\\Member','SilverStripe\\Security\\MemberPassword','SilverStripe\\Security\\Permission','SilverStripe\\Security\\PermissionRole','SilverStripe\\Security\\PermissionRoleCode','SilverStripe\\Security\\RememberLoginHash','SilverStripe\\UserForms\\Model\\EditableCustomRule','SilverStripe\\UserForms\\Model\\EditableFormField','TractorCow\\Fluent\\Model\\Domain','TractorCow\\Fluent\\Model\\FallbackLocale','TractorCow\\Fluent\\Model\\Locale','SilverStripe\\UserForms\\Model\\EditableFormField\\EditableOption','SilverStripe\\UserForms\\Model\\Recipient\\EmailRecipient','SilverStripe\\UserForms\\Model\\Recipient\\EmailRecipientCondition','SilverStripe\\UserForms\\Model\\Submission\\SubmittedForm','SilverStripe\\UserForms\\Model\\Submission\\SubmittedFormField','SilverStripe\\Assets\\Folder','SilverStripe\\Assets\\Image','DNADesign\\Elemental\\Models\\ElementContent','DNADesign\\ElementalUserForms\\Model\\ElementForm','DNADesign\\ElementalVirtual\\Model\\ElementVirtual','Page','App\\Models\\ElementPage','SilverStripe\\Blog\\Model\\Blog','SilverStripe\\Blog\\Model\\BlogPost','SilverStripe\\CMS\\Model\\RedirectorPage','SilverStripe\\CMS\\Model\\VirtualPage','SilverStripe\\UserForms\\Model\\UserDefinedForm','App\\Models\\EditableFormField\\EditableCheckboxTerms','SilverStripe\\UserForms\\Model\\EditableFormField\\EditableCheckbox','SilverStripe\\UserForms\\Model\\EditableFormField\\EditableCountryDropdownField','SilverStripe\\UserForms\\Model\\EditableFormField\\EditableDateField','SilverStripe\\UserForms\\Model\\EditableFormField\\EditableEmailField','SilverStripe\\UserForms\\Model\\EditableFormField\\EditableFieldGroup','SilverStripe\\UserForms\\Model\\EditableFormField\\EditableFieldGroupEnd','SilverStripe\\UserForms\\Model\\EditableFormField\\EditableFileField','SilverStripe\\UserForms\\Model\\EditableFormField\\EditableFormHeading','SilverStripe\\UserForms\\Model\\EditableFormField\\EditableFormStep','SilverStripe\\UserForms\\Model\\EditableFormField\\EditableLiteralField','SilverStripe\\UserForms\\Model\\EditableFormField\\EditableMemberListField','SilverStripe\\UserForms\\Model\\EditableFormField\\EditableMultipleOptionField','SilverStripe\\UserForms\\Model\\EditableFormField\\EditableNumericField','SilverStripe\\UserForms\\Model\\EditableFormField\\EditableTextField','SilverStripe\\UserForms\\Model\\EditableFormField\\EditableCheckboxGroupField','SilverStripe\\UserForms\\Model\\EditableFormField\\EditableDropdown','SilverStripe\\UserForms\\Model\\EditableFormField\\EditableRadioField','SilverStripe\\UserForms\\Model\\Submission\\SubmittedFileField') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'SilverStripe\\Assets\\File'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `SubmittedFormField`
--

CREATE TABLE `SubmittedFormField` (
  `ID` int(11) NOT NULL,
  `ClassName` enum('SilverStripe\\UserForms\\Model\\Submission\\SubmittedFormField','SilverStripe\\UserForms\\Model\\Submission\\SubmittedFileField') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'SilverStripe\\UserForms\\Model\\Submission\\SubmittedFormField',
  `LastEdited` datetime DEFAULT NULL,
  `Created` datetime DEFAULT NULL,
  `Name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Value` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Displayed` tinyint(1) UNSIGNED NOT NULL DEFAULT 0,
  `ParentID` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `UserDefinedForm`
--

CREATE TABLE `UserDefinedForm` (
  `ID` int(11) NOT NULL,
  `SubmitButtonText` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ClearButtonText` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `OnCompleteMessage` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ShowClearButton` tinyint(1) UNSIGNED NOT NULL DEFAULT 0,
  `DisableSaveSubmissions` tinyint(1) UNSIGNED NOT NULL DEFAULT 0,
  `EnableLiveValidation` tinyint(1) UNSIGNED NOT NULL DEFAULT 0,
  `DisplayErrorMessagesAtTop` tinyint(1) UNSIGNED NOT NULL DEFAULT 0,
  `DisableAuthenicatedFinishAction` tinyint(1) UNSIGNED NOT NULL DEFAULT 0,
  `DisableCsrfSecurityToken` tinyint(1) UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `UserDefinedForm_EmailRecipient`
--

CREATE TABLE `UserDefinedForm_EmailRecipient` (
  `ID` int(11) NOT NULL,
  `ClassName` enum('SilverStripe\\UserForms\\Model\\Recipient\\EmailRecipient') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'SilverStripe\\UserForms\\Model\\Recipient\\EmailRecipient',
  `LastEdited` datetime DEFAULT NULL,
  `Created` datetime DEFAULT NULL,
  `EmailAddress` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `EmailSubject` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `EmailFrom` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `EmailReplyTo` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `EmailBody` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `EmailBodyHtml` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `EmailTemplate` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `SendPlain` tinyint(1) UNSIGNED NOT NULL DEFAULT 0,
  `HideFormData` tinyint(1) UNSIGNED NOT NULL DEFAULT 0,
  `HideInvisibleFields` tinyint(1) UNSIGNED NOT NULL DEFAULT 0,
  `CustomRulesCondition` enum('And','Or') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'And',
  `SendEmailFromFieldID` int(11) NOT NULL DEFAULT 0,
  `SendEmailToFieldID` int(11) NOT NULL DEFAULT 0,
  `SendEmailSubjectFieldID` int(11) NOT NULL DEFAULT 0,
  `FormID` int(11) NOT NULL DEFAULT 0,
  `FormClass` enum('SilverStripe\\Assets\\File','SilverStripe\\SiteConfig\\SiteConfig','SilverStripe\\Versioned\\ChangeSet','SilverStripe\\Versioned\\ChangeSetItem','DNADesign\\Elemental\\Models\\BaseElement','DNADesign\\Elemental\\Models\\ElementalArea','SilverStripe\\Assets\\Shortcodes\\FileLink','SilverStripe\\Blog\\Model\\BlogCategory','SilverStripe\\Blog\\Model\\BlogTag','SilverStripe\\CMS\\Model\\SiteTree','SilverStripe\\CMS\\Model\\SiteTreeLink','SilverStripe\\Security\\Group','SilverStripe\\Security\\LoginAttempt','SilverStripe\\Security\\Member','SilverStripe\\Security\\MemberPassword','SilverStripe\\Security\\Permission','SilverStripe\\Security\\PermissionRole','SilverStripe\\Security\\PermissionRoleCode','SilverStripe\\Security\\RememberLoginHash','SilverStripe\\UserForms\\Model\\EditableCustomRule','SilverStripe\\UserForms\\Model\\EditableFormField','TractorCow\\Fluent\\Model\\Domain','TractorCow\\Fluent\\Model\\FallbackLocale','TractorCow\\Fluent\\Model\\Locale','SilverStripe\\UserForms\\Model\\EditableFormField\\EditableOption','SilverStripe\\UserForms\\Model\\Recipient\\EmailRecipient','SilverStripe\\UserForms\\Model\\Recipient\\EmailRecipientCondition','SilverStripe\\UserForms\\Model\\Submission\\SubmittedForm','SilverStripe\\UserForms\\Model\\Submission\\SubmittedFormField','SilverStripe\\Assets\\Folder','SilverStripe\\Assets\\Image','DNADesign\\Elemental\\Models\\ElementContent','DNADesign\\ElementalUserForms\\Model\\ElementForm','DNADesign\\ElementalVirtual\\Model\\ElementVirtual','Page','App\\Models\\ElementPage','SilverStripe\\Blog\\Model\\Blog','SilverStripe\\Blog\\Model\\BlogPost','SilverStripe\\CMS\\Model\\RedirectorPage','SilverStripe\\CMS\\Model\\VirtualPage','SilverStripe\\UserForms\\Model\\UserDefinedForm','App\\Models\\EditableFormField\\EditableCheckboxTerms','SilverStripe\\UserForms\\Model\\EditableFormField\\EditableCheckbox','SilverStripe\\UserForms\\Model\\EditableFormField\\EditableCountryDropdownField','SilverStripe\\UserForms\\Model\\EditableFormField\\EditableDateField','SilverStripe\\UserForms\\Model\\EditableFormField\\EditableEmailField','SilverStripe\\UserForms\\Model\\EditableFormField\\EditableFieldGroup','SilverStripe\\UserForms\\Model\\EditableFormField\\EditableFieldGroupEnd','SilverStripe\\UserForms\\Model\\EditableFormField\\EditableFileField','SilverStripe\\UserForms\\Model\\EditableFormField\\EditableFormHeading','SilverStripe\\UserForms\\Model\\EditableFormField\\EditableFormStep','SilverStripe\\UserForms\\Model\\EditableFormField\\EditableLiteralField','SilverStripe\\UserForms\\Model\\EditableFormField\\EditableMemberListField','SilverStripe\\UserForms\\Model\\EditableFormField\\EditableMultipleOptionField','SilverStripe\\UserForms\\Model\\EditableFormField\\EditableNumericField','SilverStripe\\UserForms\\Model\\EditableFormField\\EditableTextField','SilverStripe\\UserForms\\Model\\EditableFormField\\EditableCheckboxGroupField','SilverStripe\\UserForms\\Model\\EditableFormField\\EditableDropdown','SilverStripe\\UserForms\\Model\\EditableFormField\\EditableRadioField','SilverStripe\\UserForms\\Model\\Submission\\SubmittedFileField') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'SilverStripe\\Assets\\File'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `UserDefinedForm_EmailRecipientCondition`
--

CREATE TABLE `UserDefinedForm_EmailRecipientCondition` (
  `ID` int(11) NOT NULL,
  `ClassName` enum('SilverStripe\\UserForms\\Model\\Recipient\\EmailRecipientCondition') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'SilverStripe\\UserForms\\Model\\Recipient\\EmailRecipientCondition',
  `LastEdited` datetime DEFAULT NULL,
  `Created` datetime DEFAULT NULL,
  `ConditionOption` enum('IsBlank','IsNotBlank','Equals','NotEquals','ValueLessThan','ValueLessThanEqual','ValueGreaterThan','ValueGreaterThanEqual','Includes') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'IsBlank',
  `ConditionValue` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ParentID` int(11) NOT NULL DEFAULT 0,
  `ConditionFieldID` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `UserDefinedForm_Live`
--

CREATE TABLE `UserDefinedForm_Live` (
  `ID` int(11) NOT NULL,
  `SubmitButtonText` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ClearButtonText` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `OnCompleteMessage` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ShowClearButton` tinyint(1) UNSIGNED NOT NULL DEFAULT 0,
  `DisableSaveSubmissions` tinyint(1) UNSIGNED NOT NULL DEFAULT 0,
  `EnableLiveValidation` tinyint(1) UNSIGNED NOT NULL DEFAULT 0,
  `DisplayErrorMessagesAtTop` tinyint(1) UNSIGNED NOT NULL DEFAULT 0,
  `DisableAuthenicatedFinishAction` tinyint(1) UNSIGNED NOT NULL DEFAULT 0,
  `DisableCsrfSecurityToken` tinyint(1) UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `UserDefinedForm_Localised`
--

CREATE TABLE `UserDefinedForm_Localised` (
  `ID` int(11) NOT NULL,
  `RecordID` int(11) NOT NULL DEFAULT 0,
  `Locale` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `SubmitButtonText` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ClearButtonText` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `OnCompleteMessage` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `UserDefinedForm_Localised_Live`
--

CREATE TABLE `UserDefinedForm_Localised_Live` (
  `ID` int(11) NOT NULL,
  `RecordID` int(11) NOT NULL DEFAULT 0,
  `Locale` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `SubmitButtonText` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ClearButtonText` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `OnCompleteMessage` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `UserDefinedForm_Localised_Versions`
--

CREATE TABLE `UserDefinedForm_Localised_Versions` (
  `Version` int(11) NOT NULL DEFAULT 0,
  `ID` int(11) NOT NULL,
  `RecordID` int(11) NOT NULL DEFAULT 0,
  `Locale` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `SubmitButtonText` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ClearButtonText` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `OnCompleteMessage` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `UserDefinedForm_Versions`
--

CREATE TABLE `UserDefinedForm_Versions` (
  `ID` int(11) NOT NULL,
  `RecordID` int(11) NOT NULL DEFAULT 0,
  `Version` int(11) NOT NULL DEFAULT 0,
  `SubmitButtonText` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ClearButtonText` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `OnCompleteMessage` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ShowClearButton` tinyint(1) UNSIGNED NOT NULL DEFAULT 0,
  `DisableSaveSubmissions` tinyint(1) UNSIGNED NOT NULL DEFAULT 0,
  `EnableLiveValidation` tinyint(1) UNSIGNED NOT NULL DEFAULT 0,
  `DisplayErrorMessagesAtTop` tinyint(1) UNSIGNED NOT NULL DEFAULT 0,
  `DisableAuthenicatedFinishAction` tinyint(1) UNSIGNED NOT NULL DEFAULT 0,
  `DisableCsrfSecurityToken` tinyint(1) UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `VirtualPage`
--

CREATE TABLE `VirtualPage` (
  `ID` int(11) NOT NULL,
  `VersionID` int(11) NOT NULL DEFAULT 0,
  `CopyContentFromID` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `VirtualPage_Live`
--

CREATE TABLE `VirtualPage_Live` (
  `ID` int(11) NOT NULL,
  `VersionID` int(11) NOT NULL DEFAULT 0,
  `CopyContentFromID` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `VirtualPage_Versions`
--

CREATE TABLE `VirtualPage_Versions` (
  `ID` int(11) NOT NULL,
  `RecordID` int(11) NOT NULL DEFAULT 0,
  `Version` int(11) NOT NULL DEFAULT 0,
  `VersionID` int(11) NOT NULL DEFAULT 0,
  `CopyContentFromID` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indizes der exportierten Tabellen
--

--
-- Indizes für die Tabelle `Blog`
--
ALTER TABLE `Blog`
  ADD PRIMARY KEY (`ID`);

--
-- Indizes für die Tabelle `BlogCategory`
--
ALTER TABLE `BlogCategory`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `ClassName` (`ClassName`),
  ADD KEY `BlogID` (`BlogID`);

--
-- Indizes für die Tabelle `BlogCategory_Localised`
--
ALTER TABLE `BlogCategory_Localised`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `Fluent_Record` (`RecordID`,`Locale`);

--
-- Indizes für die Tabelle `BlogPost`
--
ALTER TABLE `BlogPost`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `PublishDate` (`PublishDate`),
  ADD KEY `FeaturedImageID` (`FeaturedImageID`);

--
-- Indizes für die Tabelle `BlogPost_Authors`
--
ALTER TABLE `BlogPost_Authors`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `BlogPostID` (`BlogPostID`),
  ADD KEY `MemberID` (`MemberID`);

--
-- Indizes für die Tabelle `BlogPost_Categories`
--
ALTER TABLE `BlogPost_Categories`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `BlogPostID` (`BlogPostID`),
  ADD KEY `BlogCategoryID` (`BlogCategoryID`);

--
-- Indizes für die Tabelle `BlogPost_Live`
--
ALTER TABLE `BlogPost_Live`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `PublishDate` (`PublishDate`),
  ADD KEY `FeaturedImageID` (`FeaturedImageID`);

--
-- Indizes für die Tabelle `BlogPost_Localised`
--
ALTER TABLE `BlogPost_Localised`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `Fluent_Record` (`RecordID`,`Locale`);

--
-- Indizes für die Tabelle `BlogPost_Localised_Live`
--
ALTER TABLE `BlogPost_Localised_Live`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `Fluent_Record` (`RecordID`,`Locale`);

--
-- Indizes für die Tabelle `BlogPost_Localised_Versions`
--
ALTER TABLE `BlogPost_Localised_Versions`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `Fluent_Record` (`RecordID`,`Locale`,`Version`),
  ADD KEY `Fluent_Version` (`RecordID`,`Version`);

--
-- Indizes für die Tabelle `BlogPost_Tags`
--
ALTER TABLE `BlogPost_Tags`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `BlogPostID` (`BlogPostID`),
  ADD KEY `BlogTagID` (`BlogTagID`);

--
-- Indizes für die Tabelle `BlogPost_Versions`
--
ALTER TABLE `BlogPost_Versions`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `RecordID_Version` (`RecordID`,`Version`),
  ADD KEY `RecordID` (`RecordID`),
  ADD KEY `Version` (`Version`),
  ADD KEY `PublishDate` (`PublishDate`),
  ADD KEY `FeaturedImageID` (`FeaturedImageID`);

--
-- Indizes für die Tabelle `BlogTag`
--
ALTER TABLE `BlogTag`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `ClassName` (`ClassName`),
  ADD KEY `BlogID` (`BlogID`);

--
-- Indizes für die Tabelle `Blog_Contributors`
--
ALTER TABLE `Blog_Contributors`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `BlogID` (`BlogID`),
  ADD KEY `MemberID` (`MemberID`);

--
-- Indizes für die Tabelle `Blog_Editors`
--
ALTER TABLE `Blog_Editors`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `BlogID` (`BlogID`),
  ADD KEY `MemberID` (`MemberID`);

--
-- Indizes für die Tabelle `Blog_Live`
--
ALTER TABLE `Blog_Live`
  ADD PRIMARY KEY (`ID`);

--
-- Indizes für die Tabelle `Blog_Versions`
--
ALTER TABLE `Blog_Versions`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `RecordID_Version` (`RecordID`,`Version`),
  ADD KEY `RecordID` (`RecordID`),
  ADD KEY `Version` (`Version`);

--
-- Indizes für die Tabelle `Blog_Writers`
--
ALTER TABLE `Blog_Writers`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `BlogID` (`BlogID`),
  ADD KEY `MemberID` (`MemberID`);

--
-- Indizes für die Tabelle `ChangeSet`
--
ALTER TABLE `ChangeSet`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `State` (`State`),
  ADD KEY `ID` (`ID`),
  ADD KEY `ClassName` (`ClassName`),
  ADD KEY `OwnerID` (`OwnerID`),
  ADD KEY `PublisherID` (`PublisherID`);

--
-- Indizes für die Tabelle `ChangeSetItem`
--
ALTER TABLE `ChangeSetItem`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `ObjectUniquePerChangeSet` (`ObjectID`,`ObjectClass`,`ChangeSetID`),
  ADD KEY `ClassName` (`ClassName`),
  ADD KEY `ChangeSetID` (`ChangeSetID`),
  ADD KEY `Object` (`ObjectID`,`ObjectClass`);

--
-- Indizes für die Tabelle `ChangeSetItem_ReferencedBy`
--
ALTER TABLE `ChangeSetItem_ReferencedBy`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `ChangeSetItemID` (`ChangeSetItemID`),
  ADD KEY `ChildID` (`ChildID`);

--
-- Indizes für die Tabelle `EditableCheckbox`
--
ALTER TABLE `EditableCheckbox`
  ADD PRIMARY KEY (`ID`);

--
-- Indizes für die Tabelle `EditableCheckboxTerms`
--
ALTER TABLE `EditableCheckboxTerms`
  ADD PRIMARY KEY (`ID`);

--
-- Indizes für die Tabelle `EditableCheckboxTerms_Live`
--
ALTER TABLE `EditableCheckboxTerms_Live`
  ADD PRIMARY KEY (`ID`);

--
-- Indizes für die Tabelle `EditableCheckboxTerms_Localised`
--
ALTER TABLE `EditableCheckboxTerms_Localised`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `Fluent_Record` (`RecordID`,`Locale`);

--
-- Indizes für die Tabelle `EditableCheckboxTerms_Localised_Live`
--
ALTER TABLE `EditableCheckboxTerms_Localised_Live`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `Fluent_Record` (`RecordID`,`Locale`);

--
-- Indizes für die Tabelle `EditableCheckboxTerms_Localised_Versions`
--
ALTER TABLE `EditableCheckboxTerms_Localised_Versions`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `Fluent_Record` (`RecordID`,`Locale`,`Version`),
  ADD KEY `Fluent_Version` (`RecordID`,`Version`);

--
-- Indizes für die Tabelle `EditableCheckboxTerms_Versions`
--
ALTER TABLE `EditableCheckboxTerms_Versions`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `RecordID_Version` (`RecordID`,`Version`),
  ADD KEY `RecordID` (`RecordID`),
  ADD KEY `Version` (`Version`);

--
-- Indizes für die Tabelle `EditableCheckbox_Live`
--
ALTER TABLE `EditableCheckbox_Live`
  ADD PRIMARY KEY (`ID`);

--
-- Indizes für die Tabelle `EditableCheckbox_Versions`
--
ALTER TABLE `EditableCheckbox_Versions`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `RecordID_Version` (`RecordID`,`Version`),
  ADD KEY `RecordID` (`RecordID`),
  ADD KEY `Version` (`Version`);

--
-- Indizes für die Tabelle `EditableCountryDropdownField`
--
ALTER TABLE `EditableCountryDropdownField`
  ADD PRIMARY KEY (`ID`);

--
-- Indizes für die Tabelle `EditableCountryDropdownField_Live`
--
ALTER TABLE `EditableCountryDropdownField_Live`
  ADD PRIMARY KEY (`ID`);

--
-- Indizes für die Tabelle `EditableCountryDropdownField_Localised`
--
ALTER TABLE `EditableCountryDropdownField_Localised`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `Fluent_Record` (`RecordID`,`Locale`);

--
-- Indizes für die Tabelle `EditableCountryDropdownField_Localised_Live`
--
ALTER TABLE `EditableCountryDropdownField_Localised_Live`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `Fluent_Record` (`RecordID`,`Locale`);

--
-- Indizes für die Tabelle `EditableCountryDropdownField_Localised_Versions`
--
ALTER TABLE `EditableCountryDropdownField_Localised_Versions`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `Fluent_Record` (`RecordID`,`Locale`,`Version`),
  ADD KEY `Fluent_Version` (`RecordID`,`Version`);

--
-- Indizes für die Tabelle `EditableCountryDropdownField_Versions`
--
ALTER TABLE `EditableCountryDropdownField_Versions`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `RecordID_Version` (`RecordID`,`Version`),
  ADD KEY `RecordID` (`RecordID`),
  ADD KEY `Version` (`Version`);

--
-- Indizes für die Tabelle `EditableCustomRule`
--
ALTER TABLE `EditableCustomRule`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `ClassName` (`ClassName`),
  ADD KEY `ParentID` (`ParentID`),
  ADD KEY `ConditionFieldID` (`ConditionFieldID`);

--
-- Indizes für die Tabelle `EditableCustomRule_Live`
--
ALTER TABLE `EditableCustomRule_Live`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `ClassName` (`ClassName`),
  ADD KEY `ParentID` (`ParentID`),
  ADD KEY `ConditionFieldID` (`ConditionFieldID`);

--
-- Indizes für die Tabelle `EditableCustomRule_Versions`
--
ALTER TABLE `EditableCustomRule_Versions`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `RecordID_Version` (`RecordID`,`Version`),
  ADD KEY `RecordID` (`RecordID`),
  ADD KEY `Version` (`Version`),
  ADD KEY `AuthorID` (`AuthorID`),
  ADD KEY `PublisherID` (`PublisherID`),
  ADD KEY `ClassName` (`ClassName`),
  ADD KEY `ParentID` (`ParentID`),
  ADD KEY `ConditionFieldID` (`ConditionFieldID`);

--
-- Indizes für die Tabelle `EditableDateField`
--
ALTER TABLE `EditableDateField`
  ADD PRIMARY KEY (`ID`);

--
-- Indizes für die Tabelle `EditableDateField_Live`
--
ALTER TABLE `EditableDateField_Live`
  ADD PRIMARY KEY (`ID`);

--
-- Indizes für die Tabelle `EditableDateField_Versions`
--
ALTER TABLE `EditableDateField_Versions`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `RecordID_Version` (`RecordID`,`Version`),
  ADD KEY `RecordID` (`RecordID`),
  ADD KEY `Version` (`Version`);

--
-- Indizes für die Tabelle `EditableDropdown`
--
ALTER TABLE `EditableDropdown`
  ADD PRIMARY KEY (`ID`);

--
-- Indizes für die Tabelle `EditableDropdown_Live`
--
ALTER TABLE `EditableDropdown_Live`
  ADD PRIMARY KEY (`ID`);

--
-- Indizes für die Tabelle `EditableDropdown_Localised`
--
ALTER TABLE `EditableDropdown_Localised`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `Fluent_Record` (`RecordID`,`Locale`);

--
-- Indizes für die Tabelle `EditableDropdown_Localised_Live`
--
ALTER TABLE `EditableDropdown_Localised_Live`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `Fluent_Record` (`RecordID`,`Locale`);

--
-- Indizes für die Tabelle `EditableDropdown_Localised_Versions`
--
ALTER TABLE `EditableDropdown_Localised_Versions`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `Fluent_Record` (`RecordID`,`Locale`,`Version`),
  ADD KEY `Fluent_Version` (`RecordID`,`Version`);

--
-- Indizes für die Tabelle `EditableDropdown_Versions`
--
ALTER TABLE `EditableDropdown_Versions`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `RecordID_Version` (`RecordID`,`Version`),
  ADD KEY `RecordID` (`RecordID`),
  ADD KEY `Version` (`Version`);

--
-- Indizes für die Tabelle `EditableFieldGroup`
--
ALTER TABLE `EditableFieldGroup`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `EndID` (`EndID`);

--
-- Indizes für die Tabelle `EditableFieldGroup_Live`
--
ALTER TABLE `EditableFieldGroup_Live`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `EndID` (`EndID`);

--
-- Indizes für die Tabelle `EditableFieldGroup_Versions`
--
ALTER TABLE `EditableFieldGroup_Versions`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `RecordID_Version` (`RecordID`,`Version`),
  ADD KEY `RecordID` (`RecordID`),
  ADD KEY `Version` (`Version`),
  ADD KEY `EndID` (`EndID`);

--
-- Indizes für die Tabelle `EditableFileField`
--
ALTER TABLE `EditableFileField`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `FolderID` (`FolderID`);

--
-- Indizes für die Tabelle `EditableFileField_Live`
--
ALTER TABLE `EditableFileField_Live`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `FolderID` (`FolderID`);

--
-- Indizes für die Tabelle `EditableFileField_Versions`
--
ALTER TABLE `EditableFileField_Versions`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `RecordID_Version` (`RecordID`,`Version`),
  ADD KEY `RecordID` (`RecordID`),
  ADD KEY `Version` (`Version`),
  ADD KEY `FolderID` (`FolderID`);

--
-- Indizes für die Tabelle `EditableFormField`
--
ALTER TABLE `EditableFormField`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `Sort` (`Sort`),
  ADD KEY `ClassName` (`ClassName`),
  ADD KEY `Parent` (`ParentID`,`ParentClass`),
  ADD KEY `Name` (`Name`);

--
-- Indizes für die Tabelle `EditableFormField_Live`
--
ALTER TABLE `EditableFormField_Live`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `Sort` (`Sort`),
  ADD KEY `ClassName` (`ClassName`),
  ADD KEY `Parent` (`ParentID`,`ParentClass`),
  ADD KEY `Name` (`Name`);

--
-- Indizes für die Tabelle `EditableFormField_Localised`
--
ALTER TABLE `EditableFormField_Localised`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `Fluent_Record` (`RecordID`,`Locale`);

--
-- Indizes für die Tabelle `EditableFormField_Localised_Live`
--
ALTER TABLE `EditableFormField_Localised_Live`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `Fluent_Record` (`RecordID`,`Locale`);

--
-- Indizes für die Tabelle `EditableFormField_Localised_Versions`
--
ALTER TABLE `EditableFormField_Localised_Versions`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `Fluent_Record` (`RecordID`,`Locale`,`Version`),
  ADD KEY `Fluent_Version` (`RecordID`,`Version`);

--
-- Indizes für die Tabelle `EditableFormField_Versions`
--
ALTER TABLE `EditableFormField_Versions`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `RecordID_Version` (`RecordID`,`Version`),
  ADD KEY `RecordID` (`RecordID`),
  ADD KEY `Version` (`Version`),
  ADD KEY `AuthorID` (`AuthorID`),
  ADD KEY `PublisherID` (`PublisherID`),
  ADD KEY `Sort` (`Sort`),
  ADD KEY `ClassName` (`ClassName`),
  ADD KEY `Parent` (`ParentID`,`ParentClass`),
  ADD KEY `Name` (`Name`);

--
-- Indizes für die Tabelle `EditableFormHeading`
--
ALTER TABLE `EditableFormHeading`
  ADD PRIMARY KEY (`ID`);

--
-- Indizes für die Tabelle `EditableFormHeading_Live`
--
ALTER TABLE `EditableFormHeading_Live`
  ADD PRIMARY KEY (`ID`);

--
-- Indizes für die Tabelle `EditableFormHeading_Versions`
--
ALTER TABLE `EditableFormHeading_Versions`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `RecordID_Version` (`RecordID`,`Version`),
  ADD KEY `RecordID` (`RecordID`),
  ADD KEY `Version` (`Version`);

--
-- Indizes für die Tabelle `EditableLiteralField`
--
ALTER TABLE `EditableLiteralField`
  ADD PRIMARY KEY (`ID`);

--
-- Indizes für die Tabelle `EditableLiteralField_Live`
--
ALTER TABLE `EditableLiteralField_Live`
  ADD PRIMARY KEY (`ID`);

--
-- Indizes für die Tabelle `EditableLiteralField_Localised`
--
ALTER TABLE `EditableLiteralField_Localised`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `Fluent_Record` (`RecordID`,`Locale`);

--
-- Indizes für die Tabelle `EditableLiteralField_Localised_Live`
--
ALTER TABLE `EditableLiteralField_Localised_Live`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `Fluent_Record` (`RecordID`,`Locale`);

--
-- Indizes für die Tabelle `EditableLiteralField_Localised_Versions`
--
ALTER TABLE `EditableLiteralField_Localised_Versions`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `Fluent_Record` (`RecordID`,`Locale`,`Version`),
  ADD KEY `Fluent_Version` (`RecordID`,`Version`);

--
-- Indizes für die Tabelle `EditableLiteralField_Versions`
--
ALTER TABLE `EditableLiteralField_Versions`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `RecordID_Version` (`RecordID`,`Version`),
  ADD KEY `RecordID` (`RecordID`),
  ADD KEY `Version` (`Version`);

--
-- Indizes für die Tabelle `EditableMemberListField`
--
ALTER TABLE `EditableMemberListField`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `GroupID` (`GroupID`);

--
-- Indizes für die Tabelle `EditableMemberListField_Live`
--
ALTER TABLE `EditableMemberListField_Live`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `GroupID` (`GroupID`);

--
-- Indizes für die Tabelle `EditableMemberListField_Versions`
--
ALTER TABLE `EditableMemberListField_Versions`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `RecordID_Version` (`RecordID`,`Version`),
  ADD KEY `RecordID` (`RecordID`),
  ADD KEY `Version` (`Version`),
  ADD KEY `GroupID` (`GroupID`);

--
-- Indizes für die Tabelle `EditableNumericField`
--
ALTER TABLE `EditableNumericField`
  ADD PRIMARY KEY (`ID`);

--
-- Indizes für die Tabelle `EditableNumericField_Live`
--
ALTER TABLE `EditableNumericField_Live`
  ADD PRIMARY KEY (`ID`);

--
-- Indizes für die Tabelle `EditableNumericField_Versions`
--
ALTER TABLE `EditableNumericField_Versions`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `RecordID_Version` (`RecordID`,`Version`),
  ADD KEY `RecordID` (`RecordID`),
  ADD KEY `Version` (`Version`);

--
-- Indizes für die Tabelle `EditableOption`
--
ALTER TABLE `EditableOption`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `Sort` (`Sort`),
  ADD KEY `ClassName` (`ClassName`),
  ADD KEY `ParentID` (`ParentID`);

--
-- Indizes für die Tabelle `EditableOption_Live`
--
ALTER TABLE `EditableOption_Live`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `Sort` (`Sort`),
  ADD KEY `ClassName` (`ClassName`),
  ADD KEY `ParentID` (`ParentID`);

--
-- Indizes für die Tabelle `EditableOption_Localised`
--
ALTER TABLE `EditableOption_Localised`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `Fluent_Record` (`RecordID`,`Locale`);

--
-- Indizes für die Tabelle `EditableOption_Localised_Live`
--
ALTER TABLE `EditableOption_Localised_Live`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `Fluent_Record` (`RecordID`,`Locale`);

--
-- Indizes für die Tabelle `EditableOption_Localised_Versions`
--
ALTER TABLE `EditableOption_Localised_Versions`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `Fluent_Record` (`RecordID`,`Locale`,`Version`),
  ADD KEY `Fluent_Version` (`RecordID`,`Version`);

--
-- Indizes für die Tabelle `EditableOption_Versions`
--
ALTER TABLE `EditableOption_Versions`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `RecordID_Version` (`RecordID`,`Version`),
  ADD KEY `RecordID` (`RecordID`),
  ADD KEY `Version` (`Version`),
  ADD KEY `AuthorID` (`AuthorID`),
  ADD KEY `PublisherID` (`PublisherID`),
  ADD KEY `Sort` (`Sort`),
  ADD KEY `ClassName` (`ClassName`),
  ADD KEY `ParentID` (`ParentID`);

--
-- Indizes für die Tabelle `EditableTextField`
--
ALTER TABLE `EditableTextField`
  ADD PRIMARY KEY (`ID`);

--
-- Indizes für die Tabelle `EditableTextField_Live`
--
ALTER TABLE `EditableTextField_Live`
  ADD PRIMARY KEY (`ID`);

--
-- Indizes für die Tabelle `EditableTextField_Localised`
--
ALTER TABLE `EditableTextField_Localised`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `Fluent_Record` (`RecordID`,`Locale`);

--
-- Indizes für die Tabelle `EditableTextField_Localised_Live`
--
ALTER TABLE `EditableTextField_Localised_Live`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `Fluent_Record` (`RecordID`,`Locale`);

--
-- Indizes für die Tabelle `EditableTextField_Localised_Versions`
--
ALTER TABLE `EditableTextField_Localised_Versions`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `Fluent_Record` (`RecordID`,`Locale`,`Version`),
  ADD KEY `Fluent_Version` (`RecordID`,`Version`);

--
-- Indizes für die Tabelle `EditableTextField_Versions`
--
ALTER TABLE `EditableTextField_Versions`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `RecordID_Version` (`RecordID`,`Version`),
  ADD KEY `RecordID` (`RecordID`),
  ADD KEY `Version` (`Version`);

--
-- Indizes für die Tabelle `Element`
--
ALTER TABLE `Element`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `Sort` (`Sort`),
  ADD KEY `ClassName` (`ClassName`),
  ADD KEY `TopPageID` (`TopPageID`),
  ADD KEY `ParentID` (`ParentID`);

--
-- Indizes für die Tabelle `ElementalArea`
--
ALTER TABLE `ElementalArea`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `ClassName` (`ClassName`),
  ADD KEY `TopPageID` (`TopPageID`);

--
-- Indizes für die Tabelle `ElementalArea_Live`
--
ALTER TABLE `ElementalArea_Live`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `ClassName` (`ClassName`),
  ADD KEY `TopPageID` (`TopPageID`);

--
-- Indizes für die Tabelle `ElementalArea_Versions`
--
ALTER TABLE `ElementalArea_Versions`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `RecordID_Version` (`RecordID`,`Version`),
  ADD KEY `RecordID` (`RecordID`),
  ADD KEY `Version` (`Version`),
  ADD KEY `AuthorID` (`AuthorID`),
  ADD KEY `PublisherID` (`PublisherID`),
  ADD KEY `ClassName` (`ClassName`),
  ADD KEY `TopPageID` (`TopPageID`);

--
-- Indizes für die Tabelle `ElementContent`
--
ALTER TABLE `ElementContent`
  ADD PRIMARY KEY (`ID`);

--
-- Indizes für die Tabelle `ElementContent_Live`
--
ALTER TABLE `ElementContent_Live`
  ADD PRIMARY KEY (`ID`);

--
-- Indizes für die Tabelle `ElementContent_Localised`
--
ALTER TABLE `ElementContent_Localised`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `Fluent_Record` (`RecordID`,`Locale`);

--
-- Indizes für die Tabelle `ElementContent_Localised_Live`
--
ALTER TABLE `ElementContent_Localised_Live`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `Fluent_Record` (`RecordID`,`Locale`);

--
-- Indizes für die Tabelle `ElementContent_Localised_Versions`
--
ALTER TABLE `ElementContent_Localised_Versions`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `Fluent_Record` (`RecordID`,`Locale`,`Version`),
  ADD KEY `Fluent_Version` (`RecordID`,`Version`);

--
-- Indizes für die Tabelle `ElementContent_Versions`
--
ALTER TABLE `ElementContent_Versions`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `RecordID_Version` (`RecordID`,`Version`),
  ADD KEY `RecordID` (`RecordID`),
  ADD KEY `Version` (`Version`);

--
-- Indizes für die Tabelle `ElementForm`
--
ALTER TABLE `ElementForm`
  ADD PRIMARY KEY (`ID`);

--
-- Indizes für die Tabelle `ElementForm_Live`
--
ALTER TABLE `ElementForm_Live`
  ADD PRIMARY KEY (`ID`);

--
-- Indizes für die Tabelle `ElementForm_Localised`
--
ALTER TABLE `ElementForm_Localised`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `Fluent_Record` (`RecordID`,`Locale`);

--
-- Indizes für die Tabelle `ElementForm_Localised_Live`
--
ALTER TABLE `ElementForm_Localised_Live`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `Fluent_Record` (`RecordID`,`Locale`);

--
-- Indizes für die Tabelle `ElementForm_Localised_Versions`
--
ALTER TABLE `ElementForm_Localised_Versions`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `Fluent_Record` (`RecordID`,`Locale`,`Version`),
  ADD KEY `Fluent_Version` (`RecordID`,`Version`);

--
-- Indizes für die Tabelle `ElementForm_Versions`
--
ALTER TABLE `ElementForm_Versions`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `RecordID_Version` (`RecordID`,`Version`),
  ADD KEY `RecordID` (`RecordID`),
  ADD KEY `Version` (`Version`);

--
-- Indizes für die Tabelle `ElementPage`
--
ALTER TABLE `ElementPage`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `ElementalAreaID` (`ElementalAreaID`);

--
-- Indizes für die Tabelle `ElementPage_Live`
--
ALTER TABLE `ElementPage_Live`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `ElementalAreaID` (`ElementalAreaID`);

--
-- Indizes für die Tabelle `ElementPage_Versions`
--
ALTER TABLE `ElementPage_Versions`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `RecordID_Version` (`RecordID`,`Version`),
  ADD KEY `RecordID` (`RecordID`),
  ADD KEY `Version` (`Version`),
  ADD KEY `ElementalAreaID` (`ElementalAreaID`);

--
-- Indizes für die Tabelle `ElementVirtual`
--
ALTER TABLE `ElementVirtual`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `LinkedElementID` (`LinkedElementID`);

--
-- Indizes für die Tabelle `ElementVirtual_Live`
--
ALTER TABLE `ElementVirtual_Live`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `LinkedElementID` (`LinkedElementID`);

--
-- Indizes für die Tabelle `ElementVirtual_Versions`
--
ALTER TABLE `ElementVirtual_Versions`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `RecordID_Version` (`RecordID`,`Version`),
  ADD KEY `RecordID` (`RecordID`),
  ADD KEY `Version` (`Version`),
  ADD KEY `LinkedElementID` (`LinkedElementID`);

--
-- Indizes für die Tabelle `Element_Live`
--
ALTER TABLE `Element_Live`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `Sort` (`Sort`),
  ADD KEY `ClassName` (`ClassName`),
  ADD KEY `TopPageID` (`TopPageID`),
  ADD KEY `ParentID` (`ParentID`);

--
-- Indizes für die Tabelle `Element_Localised`
--
ALTER TABLE `Element_Localised`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `Fluent_Record` (`RecordID`,`Locale`);

--
-- Indizes für die Tabelle `Element_Localised_Live`
--
ALTER TABLE `Element_Localised_Live`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `Fluent_Record` (`RecordID`,`Locale`);

--
-- Indizes für die Tabelle `Element_Localised_Versions`
--
ALTER TABLE `Element_Localised_Versions`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `Fluent_Record` (`RecordID`,`Locale`,`Version`),
  ADD KEY `Fluent_Version` (`RecordID`,`Version`);

--
-- Indizes für die Tabelle `Element_Versions`
--
ALTER TABLE `Element_Versions`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `RecordID_Version` (`RecordID`,`Version`),
  ADD KEY `RecordID` (`RecordID`),
  ADD KEY `Version` (`Version`),
  ADD KEY `AuthorID` (`AuthorID`),
  ADD KEY `PublisherID` (`PublisherID`),
  ADD KEY `Sort` (`Sort`),
  ADD KEY `ClassName` (`ClassName`),
  ADD KEY `TopPageID` (`TopPageID`),
  ADD KEY `ParentID` (`ParentID`);

--
-- Indizes für die Tabelle `File`
--
ALTER TABLE `File`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `Name` (`Name`),
  ADD KEY `ClassName` (`ClassName`),
  ADD KEY `ParentID` (`ParentID`),
  ADD KEY `OwnerID` (`OwnerID`),
  ADD KEY `FileHash` (`FileHash`);

--
-- Indizes für die Tabelle `FileLink`
--
ALTER TABLE `FileLink`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `ClassName` (`ClassName`),
  ADD KEY `LinkedID` (`LinkedID`),
  ADD KEY `Parent` (`ParentID`,`ParentClass`);

--
-- Indizes für die Tabelle `File_EditorGroups`
--
ALTER TABLE `File_EditorGroups`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `FileID` (`FileID`),
  ADD KEY `GroupID` (`GroupID`);

--
-- Indizes für die Tabelle `File_EditorMembers`
--
ALTER TABLE `File_EditorMembers`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `FileID` (`FileID`),
  ADD KEY `MemberID` (`MemberID`);

--
-- Indizes für die Tabelle `File_Live`
--
ALTER TABLE `File_Live`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `Name` (`Name`),
  ADD KEY `ClassName` (`ClassName`),
  ADD KEY `ParentID` (`ParentID`),
  ADD KEY `OwnerID` (`OwnerID`),
  ADD KEY `FileHash` (`FileHash`);

--
-- Indizes für die Tabelle `File_Versions`
--
ALTER TABLE `File_Versions`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `RecordID_Version` (`RecordID`,`Version`),
  ADD KEY `RecordID` (`RecordID`),
  ADD KEY `Version` (`Version`),
  ADD KEY `AuthorID` (`AuthorID`),
  ADD KEY `PublisherID` (`PublisherID`),
  ADD KEY `Name` (`Name`),
  ADD KEY `ClassName` (`ClassName`),
  ADD KEY `ParentID` (`ParentID`),
  ADD KEY `OwnerID` (`OwnerID`),
  ADD KEY `FileHash` (`FileHash`);

--
-- Indizes für die Tabelle `File_ViewerGroups`
--
ALTER TABLE `File_ViewerGroups`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `FileID` (`FileID`),
  ADD KEY `GroupID` (`GroupID`);

--
-- Indizes für die Tabelle `File_ViewerMembers`
--
ALTER TABLE `File_ViewerMembers`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `FileID` (`FileID`),
  ADD KEY `MemberID` (`MemberID`);

--
-- Indizes für die Tabelle `Fluent_Domain`
--
ALTER TABLE `Fluent_Domain`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `ClassName` (`ClassName`),
  ADD KEY `DefaultLocaleID` (`DefaultLocaleID`);

--
-- Indizes für die Tabelle `Fluent_FallbackLocale`
--
ALTER TABLE `Fluent_FallbackLocale`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `ClassName` (`ClassName`),
  ADD KEY `ParentID` (`ParentID`),
  ADD KEY `LocaleID` (`LocaleID`);

--
-- Indizes für die Tabelle `Fluent_Locale`
--
ALTER TABLE `Fluent_Locale`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `Sort` (`Sort`),
  ADD KEY `Locale` (`Locale`),
  ADD KEY `ClassName` (`ClassName`),
  ADD KEY `DomainID` (`DomainID`);

--
-- Indizes für die Tabelle `Group`
--
ALTER TABLE `Group`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `ClassName` (`ClassName`),
  ADD KEY `ParentID` (`ParentID`),
  ADD KEY `Title` (`Title`),
  ADD KEY `Code` (`Code`),
  ADD KEY `Sort` (`Sort`);

--
-- Indizes für die Tabelle `Group_Members`
--
ALTER TABLE `Group_Members`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `GroupID` (`GroupID`),
  ADD KEY `MemberID` (`MemberID`);

--
-- Indizes für die Tabelle `Group_Roles`
--
ALTER TABLE `Group_Roles`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `GroupID` (`GroupID`),
  ADD KEY `PermissionRoleID` (`PermissionRoleID`);

--
-- Indizes für die Tabelle `Image`
--
ALTER TABLE `Image`
  ADD PRIMARY KEY (`ID`);

--
-- Indizes für die Tabelle `Image_Live`
--
ALTER TABLE `Image_Live`
  ADD PRIMARY KEY (`ID`);

--
-- Indizes für die Tabelle `Image_Versions`
--
ALTER TABLE `Image_Versions`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `RecordID_Version` (`RecordID`,`Version`),
  ADD KEY `RecordID` (`RecordID`),
  ADD KEY `Version` (`Version`);

--
-- Indizes für die Tabelle `LoginAttempt`
--
ALTER TABLE `LoginAttempt`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `ClassName` (`ClassName`),
  ADD KEY `MemberID` (`MemberID`),
  ADD KEY `EmailHashed` (`EmailHashed`);

--
-- Indizes für die Tabelle `Member`
--
ALTER TABLE `Member`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `Surname` (`Surname`),
  ADD KEY `FirstName` (`FirstName`),
  ADD KEY `ClassName` (`ClassName`),
  ADD KEY `BlogProfileImageID` (`BlogProfileImageID`),
  ADD KEY `Email` (`Email`);

--
-- Indizes für die Tabelle `MemberPassword`
--
ALTER TABLE `MemberPassword`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `ClassName` (`ClassName`),
  ADD KEY `MemberID` (`MemberID`);

--
-- Indizes für die Tabelle `Page_PageCategories`
--
ALTER TABLE `Page_PageCategories`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `PageID` (`PageID`),
  ADD KEY `BlogCategoryID` (`BlogCategoryID`);

--
-- Indizes für die Tabelle `Permission`
--
ALTER TABLE `Permission`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `ClassName` (`ClassName`),
  ADD KEY `GroupID` (`GroupID`),
  ADD KEY `Code` (`Code`);

--
-- Indizes für die Tabelle `PermissionRole`
--
ALTER TABLE `PermissionRole`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `Title` (`Title`),
  ADD KEY `ClassName` (`ClassName`);

--
-- Indizes für die Tabelle `PermissionRoleCode`
--
ALTER TABLE `PermissionRoleCode`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `ClassName` (`ClassName`),
  ADD KEY `RoleID` (`RoleID`),
  ADD KEY `Code` (`Code`);

--
-- Indizes für die Tabelle `RedirectorPage`
--
ALTER TABLE `RedirectorPage`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `LinkToID` (`LinkToID`),
  ADD KEY `LinkToFileID` (`LinkToFileID`);

--
-- Indizes für die Tabelle `RedirectorPage_Live`
--
ALTER TABLE `RedirectorPage_Live`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `LinkToID` (`LinkToID`),
  ADD KEY `LinkToFileID` (`LinkToFileID`);

--
-- Indizes für die Tabelle `RedirectorPage_Localised`
--
ALTER TABLE `RedirectorPage_Localised`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `Fluent_Record` (`RecordID`,`Locale`);

--
-- Indizes für die Tabelle `RedirectorPage_Localised_Live`
--
ALTER TABLE `RedirectorPage_Localised_Live`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `Fluent_Record` (`RecordID`,`Locale`);

--
-- Indizes für die Tabelle `RedirectorPage_Localised_Versions`
--
ALTER TABLE `RedirectorPage_Localised_Versions`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `Fluent_Record` (`RecordID`,`Locale`,`Version`),
  ADD KEY `Fluent_Version` (`RecordID`,`Version`);

--
-- Indizes für die Tabelle `RedirectorPage_Versions`
--
ALTER TABLE `RedirectorPage_Versions`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `RecordID_Version` (`RecordID`,`Version`),
  ADD KEY `RecordID` (`RecordID`),
  ADD KEY `Version` (`Version`),
  ADD KEY `LinkToID` (`LinkToID`),
  ADD KEY `LinkToFileID` (`LinkToFileID`);

--
-- Indizes für die Tabelle `RememberLoginHash`
--
ALTER TABLE `RememberLoginHash`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `ClassName` (`ClassName`),
  ADD KEY `MemberID` (`MemberID`),
  ADD KEY `DeviceID` (`DeviceID`),
  ADD KEY `Hash` (`Hash`);

--
-- Indizes für die Tabelle `SiteConfig`
--
ALTER TABLE `SiteConfig`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `ClassName` (`ClassName`);

--
-- Indizes für die Tabelle `SiteConfig_CreateTopLevelGroups`
--
ALTER TABLE `SiteConfig_CreateTopLevelGroups`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `SiteConfigID` (`SiteConfigID`),
  ADD KEY `GroupID` (`GroupID`);

--
-- Indizes für die Tabelle `SiteConfig_CreateTopLevelMembers`
--
ALTER TABLE `SiteConfig_CreateTopLevelMembers`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `SiteConfigID` (`SiteConfigID`),
  ADD KEY `MemberID` (`MemberID`);

--
-- Indizes für die Tabelle `SiteConfig_EditorGroups`
--
ALTER TABLE `SiteConfig_EditorGroups`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `SiteConfigID` (`SiteConfigID`),
  ADD KEY `GroupID` (`GroupID`);

--
-- Indizes für die Tabelle `SiteConfig_EditorMembers`
--
ALTER TABLE `SiteConfig_EditorMembers`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `SiteConfigID` (`SiteConfigID`),
  ADD KEY `MemberID` (`MemberID`);

--
-- Indizes für die Tabelle `SiteConfig_Localised`
--
ALTER TABLE `SiteConfig_Localised`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `Fluent_Record` (`RecordID`,`Locale`);

--
-- Indizes für die Tabelle `SiteConfig_ViewerGroups`
--
ALTER TABLE `SiteConfig_ViewerGroups`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `SiteConfigID` (`SiteConfigID`),
  ADD KEY `GroupID` (`GroupID`);

--
-- Indizes für die Tabelle `SiteConfig_ViewerMembers`
--
ALTER TABLE `SiteConfig_ViewerMembers`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `SiteConfigID` (`SiteConfigID`),
  ADD KEY `MemberID` (`MemberID`);

--
-- Indizes für die Tabelle `SiteTree`
--
ALTER TABLE `SiteTree`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `Sort` (`Sort`),
  ADD KEY `ClassName` (`ClassName`),
  ADD KEY `ParentID` (`ParentID`),
  ADD KEY `URLSegment` (`URLSegment`);

--
-- Indizes für die Tabelle `SiteTreeLink`
--
ALTER TABLE `SiteTreeLink`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `ClassName` (`ClassName`),
  ADD KEY `LinkedID` (`LinkedID`),
  ADD KEY `Parent` (`ParentID`,`ParentClass`);

--
-- Indizes für die Tabelle `SiteTree_EditorGroups`
--
ALTER TABLE `SiteTree_EditorGroups`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `SiteTreeID` (`SiteTreeID`),
  ADD KEY `GroupID` (`GroupID`);

--
-- Indizes für die Tabelle `SiteTree_EditorMembers`
--
ALTER TABLE `SiteTree_EditorMembers`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `SiteTreeID` (`SiteTreeID`),
  ADD KEY `MemberID` (`MemberID`);

--
-- Indizes für die Tabelle `SiteTree_Live`
--
ALTER TABLE `SiteTree_Live`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `Sort` (`Sort`),
  ADD KEY `ClassName` (`ClassName`),
  ADD KEY `ParentID` (`ParentID`),
  ADD KEY `URLSegment` (`URLSegment`);

--
-- Indizes für die Tabelle `SiteTree_Localised`
--
ALTER TABLE `SiteTree_Localised`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `Fluent_Record` (`RecordID`,`Locale`);

--
-- Indizes für die Tabelle `SiteTree_Localised_Live`
--
ALTER TABLE `SiteTree_Localised_Live`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `Fluent_Record` (`RecordID`,`Locale`);

--
-- Indizes für die Tabelle `SiteTree_Localised_Versions`
--
ALTER TABLE `SiteTree_Localised_Versions`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `Fluent_Record` (`RecordID`,`Locale`,`Version`),
  ADD KEY `Fluent_Version` (`RecordID`,`Version`);

--
-- Indizes für die Tabelle `SiteTree_Versions`
--
ALTER TABLE `SiteTree_Versions`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `RecordID_Version` (`RecordID`,`Version`),
  ADD KEY `RecordID` (`RecordID`),
  ADD KEY `Version` (`Version`),
  ADD KEY `AuthorID` (`AuthorID`),
  ADD KEY `PublisherID` (`PublisherID`),
  ADD KEY `Sort` (`Sort`),
  ADD KEY `ClassName` (`ClassName`),
  ADD KEY `ParentID` (`ParentID`),
  ADD KEY `URLSegment` (`URLSegment`);

--
-- Indizes für die Tabelle `SiteTree_ViewerGroups`
--
ALTER TABLE `SiteTree_ViewerGroups`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `SiteTreeID` (`SiteTreeID`),
  ADD KEY `GroupID` (`GroupID`);

--
-- Indizes für die Tabelle `SiteTree_ViewerMembers`
--
ALTER TABLE `SiteTree_ViewerMembers`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `SiteTreeID` (`SiteTreeID`),
  ADD KEY `MemberID` (`MemberID`);

--
-- Indizes für die Tabelle `SubmittedFileField`
--
ALTER TABLE `SubmittedFileField`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `UploadedFileID` (`UploadedFileID`);

--
-- Indizes für die Tabelle `SubmittedForm`
--
ALTER TABLE `SubmittedForm`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `ClassName` (`ClassName`),
  ADD KEY `SubmittedByID` (`SubmittedByID`),
  ADD KEY `Parent` (`ParentID`,`ParentClass`);

--
-- Indizes für die Tabelle `SubmittedFormField`
--
ALTER TABLE `SubmittedFormField`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `ClassName` (`ClassName`),
  ADD KEY `ParentID` (`ParentID`),
  ADD KEY `Name` (`Name`);

--
-- Indizes für die Tabelle `UserDefinedForm`
--
ALTER TABLE `UserDefinedForm`
  ADD PRIMARY KEY (`ID`);

--
-- Indizes für die Tabelle `UserDefinedForm_EmailRecipient`
--
ALTER TABLE `UserDefinedForm_EmailRecipient`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `ClassName` (`ClassName`),
  ADD KEY `SendEmailFromFieldID` (`SendEmailFromFieldID`),
  ADD KEY `SendEmailToFieldID` (`SendEmailToFieldID`),
  ADD KEY `SendEmailSubjectFieldID` (`SendEmailSubjectFieldID`),
  ADD KEY `Form` (`FormID`,`FormClass`);

--
-- Indizes für die Tabelle `UserDefinedForm_EmailRecipientCondition`
--
ALTER TABLE `UserDefinedForm_EmailRecipientCondition`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `ClassName` (`ClassName`),
  ADD KEY `ParentID` (`ParentID`),
  ADD KEY `ConditionFieldID` (`ConditionFieldID`);

--
-- Indizes für die Tabelle `UserDefinedForm_Live`
--
ALTER TABLE `UserDefinedForm_Live`
  ADD PRIMARY KEY (`ID`);

--
-- Indizes für die Tabelle `UserDefinedForm_Localised`
--
ALTER TABLE `UserDefinedForm_Localised`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `Fluent_Record` (`RecordID`,`Locale`);

--
-- Indizes für die Tabelle `UserDefinedForm_Localised_Live`
--
ALTER TABLE `UserDefinedForm_Localised_Live`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `Fluent_Record` (`RecordID`,`Locale`);

--
-- Indizes für die Tabelle `UserDefinedForm_Localised_Versions`
--
ALTER TABLE `UserDefinedForm_Localised_Versions`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `Fluent_Record` (`RecordID`,`Locale`,`Version`),
  ADD KEY `Fluent_Version` (`RecordID`,`Version`);

--
-- Indizes für die Tabelle `UserDefinedForm_Versions`
--
ALTER TABLE `UserDefinedForm_Versions`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `RecordID_Version` (`RecordID`,`Version`),
  ADD KEY `RecordID` (`RecordID`),
  ADD KEY `Version` (`Version`);

--
-- Indizes für die Tabelle `VirtualPage`
--
ALTER TABLE `VirtualPage`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `CopyContentFromID` (`CopyContentFromID`);

--
-- Indizes für die Tabelle `VirtualPage_Live`
--
ALTER TABLE `VirtualPage_Live`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `CopyContentFromID` (`CopyContentFromID`);

--
-- Indizes für die Tabelle `VirtualPage_Versions`
--
ALTER TABLE `VirtualPage_Versions`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `RecordID_Version` (`RecordID`,`Version`),
  ADD KEY `RecordID` (`RecordID`),
  ADD KEY `Version` (`Version`),
  ADD KEY `CopyContentFromID` (`CopyContentFromID`);

--
-- AUTO_INCREMENT für exportierte Tabellen
--

--
-- AUTO_INCREMENT für Tabelle `Blog`
--
ALTER TABLE `Blog`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT für Tabelle `BlogCategory`
--
ALTER TABLE `BlogCategory`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT für Tabelle `BlogCategory_Localised`
--
ALTER TABLE `BlogCategory_Localised`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT für Tabelle `BlogPost`
--
ALTER TABLE `BlogPost`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT für Tabelle `BlogPost_Authors`
--
ALTER TABLE `BlogPost_Authors`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT für Tabelle `BlogPost_Categories`
--
ALTER TABLE `BlogPost_Categories`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT für Tabelle `BlogPost_Live`
--
ALTER TABLE `BlogPost_Live`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT für Tabelle `BlogPost_Localised`
--
ALTER TABLE `BlogPost_Localised`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT für Tabelle `BlogPost_Localised_Live`
--
ALTER TABLE `BlogPost_Localised_Live`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT für Tabelle `BlogPost_Localised_Versions`
--
ALTER TABLE `BlogPost_Localised_Versions`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT für Tabelle `BlogPost_Tags`
--
ALTER TABLE `BlogPost_Tags`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT für Tabelle `BlogPost_Versions`
--
ALTER TABLE `BlogPost_Versions`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT für Tabelle `BlogTag`
--
ALTER TABLE `BlogTag`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT für Tabelle `Blog_Contributors`
--
ALTER TABLE `Blog_Contributors`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT für Tabelle `Blog_Editors`
--
ALTER TABLE `Blog_Editors`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT für Tabelle `Blog_Live`
--
ALTER TABLE `Blog_Live`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT für Tabelle `Blog_Versions`
--
ALTER TABLE `Blog_Versions`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT für Tabelle `Blog_Writers`
--
ALTER TABLE `Blog_Writers`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT für Tabelle `ChangeSet`
--
ALTER TABLE `ChangeSet`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT für Tabelle `ChangeSetItem`
--
ALTER TABLE `ChangeSetItem`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT für Tabelle `ChangeSetItem_ReferencedBy`
--
ALTER TABLE `ChangeSetItem_ReferencedBy`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT für Tabelle `EditableCheckbox`
--
ALTER TABLE `EditableCheckbox`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT für Tabelle `EditableCheckboxTerms`
--
ALTER TABLE `EditableCheckboxTerms`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT für Tabelle `EditableCheckboxTerms_Live`
--
ALTER TABLE `EditableCheckboxTerms_Live`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT für Tabelle `EditableCheckboxTerms_Localised`
--
ALTER TABLE `EditableCheckboxTerms_Localised`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT für Tabelle `EditableCheckboxTerms_Localised_Live`
--
ALTER TABLE `EditableCheckboxTerms_Localised_Live`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT für Tabelle `EditableCheckboxTerms_Localised_Versions`
--
ALTER TABLE `EditableCheckboxTerms_Localised_Versions`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT für Tabelle `EditableCheckboxTerms_Versions`
--
ALTER TABLE `EditableCheckboxTerms_Versions`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT für Tabelle `EditableCheckbox_Live`
--
ALTER TABLE `EditableCheckbox_Live`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT für Tabelle `EditableCheckbox_Versions`
--
ALTER TABLE `EditableCheckbox_Versions`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT für Tabelle `EditableCountryDropdownField`
--
ALTER TABLE `EditableCountryDropdownField`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT für Tabelle `EditableCountryDropdownField_Live`
--
ALTER TABLE `EditableCountryDropdownField_Live`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT für Tabelle `EditableCountryDropdownField_Localised`
--
ALTER TABLE `EditableCountryDropdownField_Localised`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT für Tabelle `EditableCountryDropdownField_Localised_Live`
--
ALTER TABLE `EditableCountryDropdownField_Localised_Live`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT für Tabelle `EditableCountryDropdownField_Localised_Versions`
--
ALTER TABLE `EditableCountryDropdownField_Localised_Versions`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT für Tabelle `EditableCountryDropdownField_Versions`
--
ALTER TABLE `EditableCountryDropdownField_Versions`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT für Tabelle `EditableCustomRule`
--
ALTER TABLE `EditableCustomRule`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT für Tabelle `EditableCustomRule_Live`
--
ALTER TABLE `EditableCustomRule_Live`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT für Tabelle `EditableCustomRule_Versions`
--
ALTER TABLE `EditableCustomRule_Versions`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT für Tabelle `EditableDateField`
--
ALTER TABLE `EditableDateField`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT für Tabelle `EditableDateField_Live`
--
ALTER TABLE `EditableDateField_Live`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT für Tabelle `EditableDateField_Versions`
--
ALTER TABLE `EditableDateField_Versions`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT für Tabelle `EditableDropdown`
--
ALTER TABLE `EditableDropdown`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT für Tabelle `EditableDropdown_Live`
--
ALTER TABLE `EditableDropdown_Live`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT für Tabelle `EditableDropdown_Localised`
--
ALTER TABLE `EditableDropdown_Localised`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT für Tabelle `EditableDropdown_Localised_Live`
--
ALTER TABLE `EditableDropdown_Localised_Live`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT für Tabelle `EditableDropdown_Localised_Versions`
--
ALTER TABLE `EditableDropdown_Localised_Versions`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT für Tabelle `EditableDropdown_Versions`
--
ALTER TABLE `EditableDropdown_Versions`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT für Tabelle `EditableFieldGroup`
--
ALTER TABLE `EditableFieldGroup`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT für Tabelle `EditableFieldGroup_Live`
--
ALTER TABLE `EditableFieldGroup_Live`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT für Tabelle `EditableFieldGroup_Versions`
--
ALTER TABLE `EditableFieldGroup_Versions`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT für Tabelle `EditableFileField`
--
ALTER TABLE `EditableFileField`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT für Tabelle `EditableFileField_Live`
--
ALTER TABLE `EditableFileField_Live`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT für Tabelle `EditableFileField_Versions`
--
ALTER TABLE `EditableFileField_Versions`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT für Tabelle `EditableFormField`
--
ALTER TABLE `EditableFormField`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT für Tabelle `EditableFormField_Live`
--
ALTER TABLE `EditableFormField_Live`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT für Tabelle `EditableFormField_Localised`
--
ALTER TABLE `EditableFormField_Localised`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT für Tabelle `EditableFormField_Localised_Live`
--
ALTER TABLE `EditableFormField_Localised_Live`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT für Tabelle `EditableFormField_Localised_Versions`
--
ALTER TABLE `EditableFormField_Localised_Versions`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT für Tabelle `EditableFormField_Versions`
--
ALTER TABLE `EditableFormField_Versions`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT für Tabelle `EditableFormHeading`
--
ALTER TABLE `EditableFormHeading`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT für Tabelle `EditableFormHeading_Live`
--
ALTER TABLE `EditableFormHeading_Live`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT für Tabelle `EditableFormHeading_Versions`
--
ALTER TABLE `EditableFormHeading_Versions`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT für Tabelle `EditableLiteralField`
--
ALTER TABLE `EditableLiteralField`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT für Tabelle `EditableLiteralField_Live`
--
ALTER TABLE `EditableLiteralField_Live`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT für Tabelle `EditableLiteralField_Localised`
--
ALTER TABLE `EditableLiteralField_Localised`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT für Tabelle `EditableLiteralField_Localised_Live`
--
ALTER TABLE `EditableLiteralField_Localised_Live`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT für Tabelle `EditableLiteralField_Localised_Versions`
--
ALTER TABLE `EditableLiteralField_Localised_Versions`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT für Tabelle `EditableLiteralField_Versions`
--
ALTER TABLE `EditableLiteralField_Versions`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT für Tabelle `EditableMemberListField`
--
ALTER TABLE `EditableMemberListField`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT für Tabelle `EditableMemberListField_Live`
--
ALTER TABLE `EditableMemberListField_Live`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT für Tabelle `EditableMemberListField_Versions`
--
ALTER TABLE `EditableMemberListField_Versions`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT für Tabelle `EditableNumericField`
--
ALTER TABLE `EditableNumericField`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT für Tabelle `EditableNumericField_Live`
--
ALTER TABLE `EditableNumericField_Live`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT für Tabelle `EditableNumericField_Versions`
--
ALTER TABLE `EditableNumericField_Versions`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT für Tabelle `EditableOption`
--
ALTER TABLE `EditableOption`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT für Tabelle `EditableOption_Live`
--
ALTER TABLE `EditableOption_Live`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT für Tabelle `EditableOption_Localised`
--
ALTER TABLE `EditableOption_Localised`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT für Tabelle `EditableOption_Localised_Live`
--
ALTER TABLE `EditableOption_Localised_Live`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT für Tabelle `EditableOption_Localised_Versions`
--
ALTER TABLE `EditableOption_Localised_Versions`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT für Tabelle `EditableOption_Versions`
--
ALTER TABLE `EditableOption_Versions`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT für Tabelle `EditableTextField`
--
ALTER TABLE `EditableTextField`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT für Tabelle `EditableTextField_Live`
--
ALTER TABLE `EditableTextField_Live`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT für Tabelle `EditableTextField_Localised`
--
ALTER TABLE `EditableTextField_Localised`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT für Tabelle `EditableTextField_Localised_Live`
--
ALTER TABLE `EditableTextField_Localised_Live`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT für Tabelle `EditableTextField_Localised_Versions`
--
ALTER TABLE `EditableTextField_Localised_Versions`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT für Tabelle `EditableTextField_Versions`
--
ALTER TABLE `EditableTextField_Versions`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT für Tabelle `Element`
--
ALTER TABLE `Element`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT für Tabelle `ElementalArea`
--
ALTER TABLE `ElementalArea`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT für Tabelle `ElementalArea_Live`
--
ALTER TABLE `ElementalArea_Live`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT für Tabelle `ElementalArea_Versions`
--
ALTER TABLE `ElementalArea_Versions`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT für Tabelle `ElementContent`
--
ALTER TABLE `ElementContent`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT für Tabelle `ElementContent_Live`
--
ALTER TABLE `ElementContent_Live`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT für Tabelle `ElementContent_Localised`
--
ALTER TABLE `ElementContent_Localised`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT für Tabelle `ElementContent_Localised_Live`
--
ALTER TABLE `ElementContent_Localised_Live`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT für Tabelle `ElementContent_Localised_Versions`
--
ALTER TABLE `ElementContent_Localised_Versions`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT für Tabelle `ElementContent_Versions`
--
ALTER TABLE `ElementContent_Versions`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT für Tabelle `ElementForm`
--
ALTER TABLE `ElementForm`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT für Tabelle `ElementForm_Live`
--
ALTER TABLE `ElementForm_Live`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT für Tabelle `ElementForm_Localised`
--
ALTER TABLE `ElementForm_Localised`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT für Tabelle `ElementForm_Localised_Live`
--
ALTER TABLE `ElementForm_Localised_Live`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT für Tabelle `ElementForm_Localised_Versions`
--
ALTER TABLE `ElementForm_Localised_Versions`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT für Tabelle `ElementForm_Versions`
--
ALTER TABLE `ElementForm_Versions`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT für Tabelle `ElementPage`
--
ALTER TABLE `ElementPage`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT für Tabelle `ElementPage_Live`
--
ALTER TABLE `ElementPage_Live`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT für Tabelle `ElementPage_Versions`
--
ALTER TABLE `ElementPage_Versions`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT für Tabelle `ElementVirtual`
--
ALTER TABLE `ElementVirtual`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT für Tabelle `ElementVirtual_Live`
--
ALTER TABLE `ElementVirtual_Live`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT für Tabelle `ElementVirtual_Versions`
--
ALTER TABLE `ElementVirtual_Versions`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT für Tabelle `Element_Live`
--
ALTER TABLE `Element_Live`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT für Tabelle `Element_Localised`
--
ALTER TABLE `Element_Localised`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT für Tabelle `Element_Localised_Live`
--
ALTER TABLE `Element_Localised_Live`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT für Tabelle `Element_Localised_Versions`
--
ALTER TABLE `Element_Localised_Versions`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT für Tabelle `Element_Versions`
--
ALTER TABLE `Element_Versions`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT für Tabelle `File`
--
ALTER TABLE `File`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT für Tabelle `FileLink`
--
ALTER TABLE `FileLink`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT für Tabelle `File_EditorGroups`
--
ALTER TABLE `File_EditorGroups`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT für Tabelle `File_EditorMembers`
--
ALTER TABLE `File_EditorMembers`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT für Tabelle `File_Live`
--
ALTER TABLE `File_Live`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT für Tabelle `File_Versions`
--
ALTER TABLE `File_Versions`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT für Tabelle `File_ViewerGroups`
--
ALTER TABLE `File_ViewerGroups`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT für Tabelle `File_ViewerMembers`
--
ALTER TABLE `File_ViewerMembers`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT für Tabelle `Fluent_Domain`
--
ALTER TABLE `Fluent_Domain`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT für Tabelle `Fluent_FallbackLocale`
--
ALTER TABLE `Fluent_FallbackLocale`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT für Tabelle `Fluent_Locale`
--
ALTER TABLE `Fluent_Locale`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT für Tabelle `Group`
--
ALTER TABLE `Group`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT für Tabelle `Group_Members`
--
ALTER TABLE `Group_Members`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT für Tabelle `Group_Roles`
--
ALTER TABLE `Group_Roles`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT für Tabelle `Image`
--
ALTER TABLE `Image`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT für Tabelle `Image_Live`
--
ALTER TABLE `Image_Live`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT für Tabelle `Image_Versions`
--
ALTER TABLE `Image_Versions`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT für Tabelle `LoginAttempt`
--
ALTER TABLE `LoginAttempt`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT für Tabelle `Member`
--
ALTER TABLE `Member`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT für Tabelle `MemberPassword`
--
ALTER TABLE `MemberPassword`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT für Tabelle `Page_PageCategories`
--
ALTER TABLE `Page_PageCategories`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT für Tabelle `Permission`
--
ALTER TABLE `Permission`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT für Tabelle `PermissionRole`
--
ALTER TABLE `PermissionRole`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT für Tabelle `PermissionRoleCode`
--
ALTER TABLE `PermissionRoleCode`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT für Tabelle `RedirectorPage`
--
ALTER TABLE `RedirectorPage`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT für Tabelle `RedirectorPage_Live`
--
ALTER TABLE `RedirectorPage_Live`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT für Tabelle `RedirectorPage_Localised`
--
ALTER TABLE `RedirectorPage_Localised`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT für Tabelle `RedirectorPage_Localised_Live`
--
ALTER TABLE `RedirectorPage_Localised_Live`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT für Tabelle `RedirectorPage_Localised_Versions`
--
ALTER TABLE `RedirectorPage_Localised_Versions`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT für Tabelle `RedirectorPage_Versions`
--
ALTER TABLE `RedirectorPage_Versions`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT für Tabelle `RememberLoginHash`
--
ALTER TABLE `RememberLoginHash`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT für Tabelle `SiteConfig`
--
ALTER TABLE `SiteConfig`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT für Tabelle `SiteConfig_CreateTopLevelGroups`
--
ALTER TABLE `SiteConfig_CreateTopLevelGroups`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT für Tabelle `SiteConfig_CreateTopLevelMembers`
--
ALTER TABLE `SiteConfig_CreateTopLevelMembers`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT für Tabelle `SiteConfig_EditorGroups`
--
ALTER TABLE `SiteConfig_EditorGroups`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT für Tabelle `SiteConfig_EditorMembers`
--
ALTER TABLE `SiteConfig_EditorMembers`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT für Tabelle `SiteConfig_Localised`
--
ALTER TABLE `SiteConfig_Localised`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT für Tabelle `SiteConfig_ViewerGroups`
--
ALTER TABLE `SiteConfig_ViewerGroups`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT für Tabelle `SiteConfig_ViewerMembers`
--
ALTER TABLE `SiteConfig_ViewerMembers`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT für Tabelle `SiteTree`
--
ALTER TABLE `SiteTree`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT für Tabelle `SiteTreeLink`
--
ALTER TABLE `SiteTreeLink`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT für Tabelle `SiteTree_EditorGroups`
--
ALTER TABLE `SiteTree_EditorGroups`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT für Tabelle `SiteTree_EditorMembers`
--
ALTER TABLE `SiteTree_EditorMembers`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT für Tabelle `SiteTree_Live`
--
ALTER TABLE `SiteTree_Live`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT für Tabelle `SiteTree_Localised`
--
ALTER TABLE `SiteTree_Localised`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT für Tabelle `SiteTree_Localised_Live`
--
ALTER TABLE `SiteTree_Localised_Live`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT für Tabelle `SiteTree_Localised_Versions`
--
ALTER TABLE `SiteTree_Localised_Versions`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT für Tabelle `SiteTree_Versions`
--
ALTER TABLE `SiteTree_Versions`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT für Tabelle `SiteTree_ViewerGroups`
--
ALTER TABLE `SiteTree_ViewerGroups`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT für Tabelle `SiteTree_ViewerMembers`
--
ALTER TABLE `SiteTree_ViewerMembers`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT für Tabelle `SubmittedFileField`
--
ALTER TABLE `SubmittedFileField`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT für Tabelle `SubmittedForm`
--
ALTER TABLE `SubmittedForm`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT für Tabelle `SubmittedFormField`
--
ALTER TABLE `SubmittedFormField`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT für Tabelle `UserDefinedForm`
--
ALTER TABLE `UserDefinedForm`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT für Tabelle `UserDefinedForm_EmailRecipient`
--
ALTER TABLE `UserDefinedForm_EmailRecipient`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT für Tabelle `UserDefinedForm_EmailRecipientCondition`
--
ALTER TABLE `UserDefinedForm_EmailRecipientCondition`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT für Tabelle `UserDefinedForm_Live`
--
ALTER TABLE `UserDefinedForm_Live`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT für Tabelle `UserDefinedForm_Localised`
--
ALTER TABLE `UserDefinedForm_Localised`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT für Tabelle `UserDefinedForm_Localised_Live`
--
ALTER TABLE `UserDefinedForm_Localised_Live`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT für Tabelle `UserDefinedForm_Localised_Versions`
--
ALTER TABLE `UserDefinedForm_Localised_Versions`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT für Tabelle `UserDefinedForm_Versions`
--
ALTER TABLE `UserDefinedForm_Versions`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT für Tabelle `VirtualPage`
--
ALTER TABLE `VirtualPage`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT für Tabelle `VirtualPage_Live`
--
ALTER TABLE `VirtualPage_Live`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT für Tabelle `VirtualPage_Versions`
--
ALTER TABLE `VirtualPage_Versions`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
