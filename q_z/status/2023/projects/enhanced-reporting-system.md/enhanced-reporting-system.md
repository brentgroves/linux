Dear bosses and friends,
I apologize for not making myself more accountable for what I am working on and for not communicating projects, tasks, and timeframes more consistently with you. I'm sure this makes your job of managing me very difficult and even irritating.  As you probably guessed, my tendency is to bury myself in tasks that I feel need to be done to achieve the coolest reporting system I can think of without getting bogged down with the approval process and consulting others as I should!  If you are willing to continue to put up with me, next year, I will try to do better.  I also hope that you feel free to 'get on me' as you feel is necessary or to kick me in the butt as needed to get what needs to be done,  done on time so that you can also get less grief and more acolytes from your own bosses. I probably don't even need to mention this because you guys are very polite and kind to me and I can not even express how much that means to me, but please continue to take it easy on me because I am more sensitive than I care to admit 😕
Sincere thanks,
Brent

Ad-Hoc reporting system justification:
I hope the summary below will help somewhat with your task of managing me and explaining the need to work on improving the Ad-Hoc reporting process and methods.

Ad-hoc real-time and longer-running reporting system:
Our out-of-the-box reporting system, Intelliplex, is great for smaller reports. It is good at easily generating nicely formatted graphs, charts, and dashboards. However, if reporting procedures require more than about a minute to process then Intelliplex will time out and not be able to finish compiling the result data so it can be reported. As you may or may not know, to answer many reporting questions more than a minute of computing time is required and another method of reporting besides the Intelliplex system must be used. One example of what we have done in this area of Ad-Hoc reporting so far is the Trial Balance accounting report which requires up to 5 minutes to produce a monthly or yearly real-time account summary. Another report, or more precisely a series of reports, requiring these types of methods is the mean time to failure reports in which we can not use our existing reporting method to consistently compare a year's worth of data for even one work center let alone using it to compare lots of work centers in any meaning way.

As you know, another limitation of our existing Intelliplex reporting system is it's not working with the most up-to-date real-time data but only a snapshot of the actual data. So, in short, we are not able to show production supervisors what is going on during a shift at a specific point in time. In other words, we have to wait until the shift is halfway over to give our customers a summary of how things were going four hours ago on the floor. So, to address the need to report on up-to-date real-time data we are using another of our Ad-Hoc reporting methods known as Plex web services.  Unfortunately, using this method to produce reports takes time and is not as quick and easy to do as writing a simple report using the out-of-the-box Intelliplex reporting system. What I mean by needing extra time is that using this method requires both time to research which web services to use as well as time to set up a method to run them on the fly and coerce the results into a database that we can generate a report from.

Another important issue being addressed by our Ad-Hoc system is that of producing reports that we can easily compare to standard everyday Plex screens which show real-time data from the actual Plex production database. To give an example of what I mean, if a customer brings up whatever Plex screen they use to perform their everyday duties they won't be able to directly compare it to reports generated using our standard Intelliplex reporting system. To iterate why this is so, the reason is that our Intelliplex reporting system is generating reports from an up to a four-hour-old snapshot of the Plex database instead of what the customer is seeing right in front of them on their Plex screen which again always shows the most up-to-date data from the Plex production database. In summary, I believe our Ad-Hoc reporting system can be used to inspire confidence from our customers by seeing that our reports show the same data that they see when looking at the normal Plex screens that they work with every day, and hopefully they will be eager to ask us to produce even more reports that will help them do their job more easily, in a faster time-frame, and in a way which is not confusing them by showing stale data from an old snapshot of the Plex database.

In summary, reporting that requires both long-running procedures and real-time data requires us to use some industry-standard methods outside of the scope of the Intelliplex reporting system. I believe it is good to understand that these methods require more time at first, but will become faster and easier as we spend more time improving and enhancing them. To better manage the need for a more comprehensive reporting system while getting the needed reports out as quickly as possible I recommend that we divide our time between these two tasks in a way that seems right to you. To this end, I have made a list of the current tasks I am working on divided into the reports that specifically need to use Ad-Hoc reporting methods and the tasks needed to improve and make faster the process of generating reports requiring longer running procedures and/or real-time data. I confess this list is not very detailed because I spent most of my time on the above justification of why we need this Ad-Hoc reporting system in the first place. Sorry about that.

Task list for long-running or real-time reports:
trial-balance
mean-time-to-failure
daily-production

Task list for ad-Hoc reporting system:
ETL scripts
crontab
python/nodejs APIs
report runner
database tasks
simple HTML web page
web application