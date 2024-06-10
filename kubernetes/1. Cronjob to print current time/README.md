
# Create cronjob to print current time

The current cronjob is going to run the job every minute

```bash
cd /cronjob.yaml file location/
kubectl apply -f cronjob.yaml
```

Result:
```bash
cronjob.batch/print-time-cronjob created
```

Watch logs for this cronjob if it printed the current time

```bash
kubectl get jobs

NAME                          COMPLETIONS   DURATION
print-time-cronjob-28633475   1/1           3s
print-time-cronjob-28633476   1/1           4s
print-time-cronjob-28633477   1/1           3s
```

Check logs on created jobs from the cronjob we applied

```bash
kubectl logs job/print-time-cronjob-28633475

Time now is 
08:32:03
```