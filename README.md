# Diagnosis #

Diagnosis is an application that can help doctors to identify how likely it is that a person has a neurological condition called Todd’s Syndrome. Application uses the following information to determine the likelihood.

* If patient have migraines
* Checks patient age (People 15 years old or younger are more likely to have it)
* Checks patient gender (There are more documented cases of men having it than woman)
* Usage of hallucinogenic drugs

### How do I get set up? ###

## Installation

Checkout Diagnosis repository to a local folder with this command:

    $ git clone git@bitbucket.org:hstepanyan/diagnosis.git

### 1. Install dependancies

In order to have application running you need to install dependancies. Go to local repository folder and use `pod install` to install necessary dependancies.

    $ cd path_to_local_repo/Diagnosis
    $ pod install

### 2. Open application with Xcode and Run

After installing dependancies `Diagnosis.xcworkspace` file will be generated. Use `Diagnosis.xcworkspace` to open project with Xcode.
