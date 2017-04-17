:css: css/impress-demo.css

----


Rails to Phoenix
================

How Elixir can level-you-up in Rails
------------------------------------

----

:data-scale: 0.0

Why not Rails?
==============
Fast to Develop
---------------
I already know it.
------------------
It does so much for me.
-----------------------
Sandi Metz just released 99 Bottles of OOP
------------------------------------------


----



:data-scale: 0.5
.. :data-x: r900
.. :data-y: r5000
.. :data-scale: 0.1



Why Phoenix?
============


 * Functional (as in Lambda Calculus, not usable, although it is)

 * Fast

 * Asynchronous

 * Explicit

 * Scalable

 * Pleasing Syntax (Similar to Ruby on Rails) - Enjoyable to Write

 * Built to Fail reliably



----


:data-scale: 1.0

.. code:: ruby


    class Example
        def self.transform(hash, key, second_arg)
            h = hash
            h[key] += second_arg
            h
        end
    end



----

:data-scale: 1.5

.. code:: ruby

    class Example
      def self.transform(hash, key, second_arg) ...  end
    end

    hash = {foo: "bar"}
    new_hash = Example.transform(hash, :foo, "second_arg")
    hash >> {:foo=>"barsecond_arg"}
    new_hash >> {:foo=>"barsecond_arg"}



----

:data-scale: 2.0

.. code:: elixir

    defmodule Example do
        def transform(map, key, second_arg) do
            Map.update!(map, :foo, fn(x) -> x <> second_arg end)
        end
    end




----

:data-scale: 2.5

.. :data-x: 2000
.. :data-y: -500
.. :data-rotate: 90
.. :data-z: 5000

What benefits does this provide?
================================

* SAFE Source control (SC) for secrets/passwords/keys
* Remove keys from git SC
* Single point to add new keys to a project
* Uniform implementation
* Keep secrets safe(er)*

----

:data-y: r1200
:data-rotate-x: 180

Concerns:
=========

* Encryption is hard to do right and easy to get wrong.
* Trust issues
* Dotenv is not the ideal choice for a production environment (according to the author)
* This implementation is a big change, not entriely intiutive, nor battle-tested (yet)

----

:data-y: r2200
:data-x: r2200
:data-z: 100

How can we use this?
====================

.. code:: bash

    $ gpg --gen-key
    gpg (GnuPG) 1.4.19; Copyright (C) 2015 Free Software Foundation, Inc.
    This is free software: you are free to change and redistribute it.
    There is NO WARRANTY, to the extent permitted by law.

    Please select what kind of key you want:
       (1) RSA and RSA (default)
       (2) DSA and Elgamal
       (3) DSA (sign only)
       (4) RSA (sign only)
    $ 1
    Your selection? 1


----

:data-y: r2200
:data-x: r2200
:data-z: 100

.. code:: bash

    RSA keys may be between 1024 and 4096 bits long.
    What keysize do you want? (2048) 4096
    Requested keysize is 4096 bits

Computesrs get faster, so always use the mazimum available key size

Set the expiration date

.. code:: ruby

    Please specify how long the key should be valid.
    0 = key does not expire
    <n>  = key expires in n days
    <n>w = key expires in n weeks
    <n>m = key expires in n months
    <n>y = key expires in n years
    Key is valid for? (0) 0
    Key does not expire at all
    Is this correct? (y/N) y

----

:data-y: r2200
:data-x: r2200
:data-z: 100

Set your personal details

.. code:: bash

    You need a user ID to identify your key; the software constructs the user ID
    from the Real Name, Comment and Email Address in this form:
        "Heinrich Heine (Der Dichter) <heinrichh@duesseldorf.de>"

    Real name: NCSA Developer
    Email address: me@ncsasports.org
    Comment:
    You selected this USER-ID:
        "Test User 1 <me@ncsasports.org>"


----

:data-y: r2200
:data-x: r2200
:data-z: 100

The passphrase is optional and is highly recommended, but not required.

.. code:: bash

    You need a Passphrase to protect your secret key.

    Enter passphrase:

*As always with passwords, choose the longest and most secure passphrase that you can remeber*

----

:data-y: r2200
:data-x: r2200
:data-z: 100

Usage in our development stack
==============================

**ncsa_oracle encrypted repo**

project_root
    └── lib

        └── key_files

            └── c3po

            └── recruit_rms

            └── shared

Jenkins Server has a deploy project that can decrypt the repo and generate a file:
*environment*.env that the project can source upon deploy.

This will expose the decrypted values into the project as ENV variables.

The project has a ruby file that takes a project and environeent argument and decrypt the files in the project folder and the shared folder.

.. code:: ruby

    ruby runner.rb recruit_rms production


The shared folder stores the keys that are (or are likely to be) common to all projects.

The project-specific folders store the values that only the given project needs.






