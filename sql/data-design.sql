DROP TABLE IF EXISTS buildLikes;
DROP TABLE IF EXISTS build;
DROP TABLE IF EXISTS profile;

CREATE TABLE profile(
    profileId binary(16) not null,
    profileActivationToken char(32),
    profileEmail varchar(128) not null,
    profileHash char(97) not null,
    profileUsername varchar(32) not null,
    profileCreationDate datetime(3) not null,
    unique(profileEmail),
    unique(profileUsername),
    index(profileEmail),
    primary key(profileId)
);

CREATE TABLE build(
    buildId binary(16) not null,
    buildProfileId binary(16) not null,
    buildName varchar(48) not null,
    buildContent varchar(300),
    buildDate datetime(3) not null,
    buildPrice decimal(7,2) not null,
    index(buildProfileId),
    foreign key(buildProfileId) references profile(profileId),
    primary key(buildId)
);

CREATE TABLE buildLike(
    buildLikeProfileId binary(16) not null,
    buildLikeBuildId binary(16) not null,
    buildLike datetime(3) not null,
    index(buildLikeProfileId),
    index(buildLikeBuildId),
    foreign key(buildLikeProfileId) references profile(profileId),
    foreign key(buildLikeBuildId) references build(buildId),
    primary key(buildLikeProfileId, buildLikeBuildId)
);