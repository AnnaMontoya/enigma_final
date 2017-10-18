Enigma

About 

![alt text](http://static.bbc.co.uk/history/img/ic/640/images/resources/topics/enigma.jpg)

During World War II the enigma machine was used by the German forces to send messages regarding military intellignce using a character map.

The machine was the first of its kind, able to encrypt messages  given a unique key and date based on rotation. 

This project imitates an enigma machine's functionality, allowing a user to encrypt and decrpyt a message. In addition, a crack feature decipher's enigma code with only a date. 

Users can choose to integrate with the application using a REPL environment, or can read and write files to the system



How it works

Each message uses a unique encryption key.

The key is five digits, like 41521
The first two digits of the key are the “A” rotation (41)
The second and third digits of the key are the “B” rotation (15)
The third and fourth digits of the key are the “C” rotation (52)
The fourth and fifth digits of the key are the “D” rotation (21)
The Offsets
The date of message transmission is also factored into the encryption Consider the date in the format DDMMYY, like 020315 Square the numeric form (412699225) and find the last four digits (9225)

The first digit is the “A offset” (9)
The second digit is the “B offset” (2)
The third digit is the “C offset” (2)
The fourth digit is the “D offset” (5)
Encrypting a Message

Four characters are encrypted at a time.
The first character is rotated forward by the “A” rotation plus the “A offset”
The second character is rotated forward by the “B” rotation plus the “B offset”
The third character is rotated forward by the “C” rotation plus the “C offset”
The fourth character is rotated forward by the “D” rotation plus the “D offset”
Decrypting a Message

Each character can be rotated forwards or backwards to calculate the encrypted/decrypted value. 


Cracking a Key

With the knowledge that each enemy message ends with the "..end..", we are able to calculate the offset and decrypt the message with only the date if the key is unknown.


Interacting with Enigma

clone this repo
cd into enigma
brew install ruby if not installed
gem install pry if not installed
run pry
Working In Pry

> require './lib/enigma'
> e = Enigma.new
> message = "lol this is not a real secret message ..end.."
> output = e.encrypt(message)
=> # encrypted message here
> output = e.encrypt(message, "12345", date) #key and date are optional (gen random key and use today's date)
=> # encrypted message here
> e.decrypt(encrypted_message, "12345", date)
=> "lol this is not a real secret message ..end.."
> e.decrypt(encrypted_message, "12345") 
=> "lol this is not a real secret message ..end.."
> e.crack(encrypted_message, date)
=> "lol this is not a real secret message ..end.."


Working with Files

As well as using pry, users can interact with enigma from the command line by leverging ARGV

$ ruby ./lib/encrypt.rb message.txt encrypted.txt
Created 'encrypted.txt' with given key and given date 
This will take the plaintext file message.txt and produce an encrypted file encrypted.txt.

If there is a known key, we can decrypt.

$ ruby ./lib/decrypt.rb encrypted.txt decrypted.txt not_a_real_key not_a_real_date
Created 'decrypted.txt' with the key not_a_real_key and date not_a_real_date
If we don’t know the key, we can try to crack it with just the date:

$ ruby ./lib/crack.rb encrypted.txt cracked.txt not_a_real_date
Created 'cracked.txt' with the cracked key not_a_real_key and date not_a_real_date