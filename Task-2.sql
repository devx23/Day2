-- Create table Country
CREATE TABLE Country (
    Id SERIAL PRIMARY KEY,
    CountryName VARCHAR(255) NOT NULL
);

-- Create table City
CREATE TABLE City (
    Id SERIAL PRIMARY KEY,
    CountryId INT REFERENCES Country(Id),
    CityName VARCHAR(255) NOT NULL
);

-- Create table MissionApplication
CREATE TABLE MissionApplication (
    Id SERIAL PRIMARY KEY,
    MissionId INT REFERENCES Missions(Id),
    UserId INT REFERENCES "User"(Id),
    AppliedDate TIMESTAMPTZ NOT NULL DEFAULT now(),
    Status BOOLEAN NOT NULL,
    Sheet INT NOT NULL
);
DROP TABLE MISSIONAPPLICATION;
-- Create table Missions
CREATE TABLE Missions (
    Id SERIAL PRIMARY KEY,
    MissionTitle VARCHAR(255) NOT NULL,
    MissionDescription TEXT NOT NULL,
    MissionOrganisationName VARCHAR(255) NOT NULL,
    MissionOrganisationDetail TEXT NOT NULL,
    CountryId INT REFERENCES Country(Id),
    CityId INT REFERENCES City(Id),
    StartDate DATE NOT NULL,
    EndDate DATE NOT NULL,
    MissionType VARCHAR(255) NOT NULL,
    TotalSheets INT,
    RegistrationDeadLine DATE NOT NULL,
    MissionThemeId INT REFERENCES MissionTheme(Id),
    MissionSkillId INT REFERENCES MissionSkill(Id),
    MissionImages TEXT,
    MissionDocuments TEXT,
    MissionAvailability TEXT,
    MissionVideoUrl TEXT
);

-- Create table MissionSkill
CREATE TABLE MissionSkill (
    Id SERIAL PRIMARY KEY,
    SkillName VARCHAR(255) NOT NULL,
    Status VARCHAR(255) NOT NULL
);

-- Create table MissionTheme
CREATE TABLE MissionTheme (
    Id SERIAL PRIMARY KEY,
    ThemeName VARCHAR(255) NOT NULL,
    Status VARCHAR(255) NOT NULL
);

-- Create table "User"
CREATE TABLE "User" (
    Id SERIAL PRIMARY KEY,
    FirstName VARCHAR(255) NOT NULL,
    LastName VARCHAR(255) NOT NULL,
    PhoneNumber VARCHAR(255),
    EmailAddress VARCHAR(255) NOT NULL,
    UserType VARCHAR(255) NOT NULL,
    Password VARCHAR(255) NOT NULL
);

-- Create table UserDetail
CREATE TABLE UserDetail (
    Id SERIAL PRIMARY KEY,
    UserId INT REFERENCES "User"(Id),
    Name VARCHAR(255) NOT NULL,
    Surname VARCHAR(255) NOT NULL,
    EmployeeId VARCHAR(255),
    Manager VARCHAR(255),
    Title VARCHAR(255),
    Department VARCHAR(255),
    MyProfile TEXT,
    WhyIVolunteer TEXT,
    CountryId INT REFERENCES Country(Id),
    CityId INT REFERENCES City(Id),
    Availability TEXT,
    LinkedInUrl TEXT,
    MySkills TEXT,
    UserImage TEXT,
    Status BOOLEAN NOT NULL
);

-- Create table UserSkills
CREATE TABLE UserSkills (
    Id SERIAL PRIMARY KEY,
    Skill VARCHAR(255) NOT NULL,
    UserId INT REFERENCES "User"(Id)
);
