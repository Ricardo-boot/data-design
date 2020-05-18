SELECT profileId, profileActivationToken, profileEmail, profileHash, profileUsername, profileCreationDate
FROM profile WHERE profileId = UNHEX("99ee99b5f7874dd1a528de4feb4b9367");

SELECT profile.profileId, profile.profileEmail, profile.profileUsername, build.buildPrice FROM profile INNER JOIN build on profile.profileId = build.buildProfileId WHERE profile.profileId = UNHEX("a461673d69cf4a0781f5aada38195b85");