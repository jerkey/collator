i can ues postgres to query how many people have a given opinion
https://youtu.be/qw--VYLpxG4?t=6333

user has a screed
a screed contains opinions (1-n of them)


1. notice a new screed
2. 

# screed table:
# CREATE TABLE (
# pubkey PRIMARY KEY,
# timestamp TIMESPTAMNTP,
# signer VARCHAR(50),
# opinions TETZt);

option 2:
CREATE TABLE pubkeys (
pubkey PRIMARY KEY,
signature_check_timestamp TIMESTAMP,
signer VARCHAR(50),
modify_time TIMESTAMP
);

CREATE TABLE pubkey_opinion (
  id BIGSERIAL PRIMARY KEY,
  pubkey_id FOREIGN KEY (pubkeys),
  opinion_id FOREIGN (opinions),
);

CREATE TABLE opinions (
id BIGSERIAL PRIMARY KEY,

whatever thing about anyone can write anything all the time is gonna be a big problem
i love talyor swift
i love what ts does
change.org has learned lessons that you will learn
learn what they'ev learned or you won't be able to go as far even as they have
i dont think its a path trying to get people too use this thing
gonna be a lot of you trying to convince people who wont understand
a lot of convincing that will need to be done
she thought people were gonna take thier liences plate off because this guy killed a ceo
we gotta capture that solidarity
this is way closer to something thats' useful,, could actually helpp people
unfroutanlye this will help everybody, and i'm not sure if it should
you're trying to make an infrastructural thing, which is neutral to politics, neutral to the values
you coudl create this, imagine you just   created the voting system and they voted fro trump, you'd be so disappointed
balance the effort you put into this
should be  purely about the utiliy, not about the good or bad things
you wnot be held up for some need of some aspect of it to be aligned with your values
thats not to say it wont align with your values
i'd love to see some group or groups using it, see what happens, i also think there's a decent amount of people who want to contribute to open-source porjects,
this one could be fairly low satek,s, people could write frontends for it, students who want to contribute or people who believe in the same concept
but it has to be highly inrfastructural

server in nodejs a bunch of callbacks, the event of a request
the functions going to be passed the request and you make a response
in the handler you're gonna use the fuckin database client, make your queries, and make your response
its just input output
frameworks that are smart to use in this realm but for a prototype you dont need that, but if you get deeper ...but for now not ready for primetime but it's gonna work
primetime is a certain level of requests, 100k or more in a minute, other than that you should be fine...some number idk, once you have something working you can show it to people...
then people with more experience can help get it to work at higher levels.
