UPDATE profile SET profileActivationToken = "newToken1", profileEmail = "markymark1@email.com", profileHash = "newPassword1", profileUsername = "markyMarkRedux1", profileCreationDate = NOW() WHERE profileId = UNHEX("99ee99b5f7874dd1a528de4feb4b9367");

DELETE FROM profile WHERE profileId = UNHEX("dfb74d8c3743483c9a7a5e00acfb4985");