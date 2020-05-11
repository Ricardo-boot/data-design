DROP TABLE IF EXISTS comments;
DROP TABLE IF EXISTS build;
DROP TABLE IF EXISTS profile;

CREATE TABLE profile(
    profileId binary(16) not null,
    profileActivationToken char(32),
    profileEmail varchar(128) not null,
    profileHash char(97) not null,
    profileUsername varchar(32) not null,
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

CREATE TABLE comments(
    commentProfileId binary(16) not null,
    commentBuildId binary(16) not null,
    commentDate datetime(3) not null,
    commentContent varchar(300) not null,
    index(commentProfileId),
    index(commentBuildId),
    foreign key(commentProfileId) references profile(profileId),
    foreign key(commentBuildId) references build(buildId),
    primary key(commentProfileId, commentBuildId)
);