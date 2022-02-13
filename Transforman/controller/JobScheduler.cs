
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Quartz;
using Quartz.Impl;

namespace Transforman.controller
{
    public class JobScheduler
    {

        public static void Start()
        {

            IScheduler scheduler = StdSchedulerFactory.GetDefaultScheduler();
            scheduler.Start();

            IJobDetail job = JobBuilder.Create<Jobclass>().Build();


            ITrigger emailSchedulerTrigger = TriggerBuilder.Create()
                .WithIdentity("esTrgName", "esTrgGroup")
                .WithCronSchedule("0 0/1 0-23 * * ? *")
                .Build();


            //ITrigger trigger = TriggerBuilder.Create()
            //.WithIdentity("trigger1", "group1")
            //.StartNow()
            //.WithSimpleSchedule(x => x
            //.WithIntervalInSeconds(10)
            //.RepeatForever())
            //.Build();

            scheduler.ScheduleJob(job, emailSchedulerTrigger);
        }
    }
}