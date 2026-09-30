USE HRDatabase;
GO

IF COL_LENGTH('dbo.Candidates', 'Qualifications') IS NULL
    ALTER TABLE dbo.Candidates ADD Qualifications NVARCHAR(500) NULL;
GO

IF COL_LENGTH('dbo.Candidates', 'LastCompanyName') IS NULL
    ALTER TABLE dbo.Candidates ADD LastCompanyName NVARCHAR(200) NULL;
GO

IF COL_LENGTH('dbo.Candidates', 'RecentGraduationDate') IS NULL
    ALTER TABLE dbo.Candidates ADD RecentGraduationDate DATE NULL;
GO

IF OBJECT_ID('dbo.uspCandidate_Save', 'P') IS NOT NULL
    DROP PROCEDURE dbo.uspCandidate_Save;
GO

CREATE PROCEDURE dbo.uspCandidate_Save
    @JobPostingId INT,
    @FirstName NVARCHAR(100),
    @LastName NVARCHAR(100),
    @Qualifications NVARCHAR(500),
    @LastCompanyName NVARCHAR(200),
    @RecentGraduationDate DATE
AS
BEGIN
    SET NOCOUNT ON;
    INSERT INTO dbo.Candidates
        (CandidateFirstName, CandidateLastName, JobPostingId, Status, Qualifications, LastCompanyName, RecentGraduationDate)
    VALUES
        (@FirstName, @LastName, @JobPostingId, 'Applied', @Qualifications, @LastCompanyName, @RecentGraduationDate);
END
GO

IF OBJECT_ID('dbo.uspGet_AllCandidates', 'P') IS NOT NULL
    DROP PROCEDURE dbo.uspGet_AllCandidates;
GO

CREATE PROCEDURE dbo.uspGet_AllCandidates
AS
BEGIN
    SET NOCOUNT ON;
    SELECT CandidateId, CandidateFirstName, CandidateLastName, JobPostingId, Status,
           Qualifications, LastCompanyName, RecentGraduationDate
    FROM dbo.Candidates;
END
GO
