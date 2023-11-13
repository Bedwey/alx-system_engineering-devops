# 0x19. Postmortem

# Postmortem Report: The "Server Tangle Tango" Incident 🕺

## **Issue Summary:**

**Duration of Outage:** 
For a brief but unforgettable 15 minutes, like a quick dance-off in the server room, starting at 09:00 AM and ending at 09:15 AM (UTC).

**Impact:**
- Our Apache server took an unscheduled coffee break during the outage.
- Users attempting to access web services had to put on their patience hats as they experienced slow response times and a virtual game of hide-and-seek with errors.
- Approximately 30% of our users got to enjoy a surprise twirl on the downtime dance floor.

**Root Cause:** 
The culprit? A mischievous misconfiguration that sneaked into our Apache configuration, all thanks to a rogue command: `echo -e "ServerName 127.0.0.1" >> /etc/apache2/apache2.conf`. This command cha-cha-cha'ed its way into our server's heart and left it bewildered.

## **Timeline:**

- **09:00 AM (UTC):** The servers went from salsa to slow-motion as users began reporting hiccups in accessing web services.

- **09:05 AM (UTC):** The monitoring system, our ever-watchful dance partner, tapped us on the shoulder with repeated alerts. "You've got an issue, my friends!" it said.

- **09:10 AM (UTC):** Our engineers put on their detective hats and hit the dance floor. The suspect? High server load due to traffic congestion, or so they thought.

- **09:12 AM (UTC):** The server load, however, was not ready for the spotlight. The investigation led to the discovery of the rogue command in the Apache configuration file, which was a big no-no in our server's dance routine.

- **09:13 AM (UTC):** Realizing the server had two left feet due to the misconfiguration, the incident was escalated to the systems administrator for a "de-tango" operation.

- **09:15 AM (UTC):** The "Server Tangle Tango" incident was elegantly resolved by reversing the Apache configuration file to its original state and removing the troublesome ServerName directive.

## **Root Cause and Resolution:**

**Root Cause:**
The "Server Tangle Tango" was choreographed by a line that sneaked into the Apache configuration file:

```shell
echo -e "ServerName 127.0.0.1" >> /etc/apache2/apache2.conf
```

This line caused the Apache server to spin out of control, setting the ServerName to the loopback IP address (127.0.0.1) and preventing it from serving external requests.

**Resolution:**
Our graceful systems administrator performed a quick pirouette to restore order:

1. Removed the misconfigured ServerName directive from the Apache configuration file.
2. Gave the Apache server a standing ovation (in the form of a restart) to apply the configuration changes.

This action brought the server back into harmony, and the "Server Tangle Tango" concluded its performance.

## **Corrective and Preventative Measures:**

To prevent future surprise dance-offs in our server room, we're taking the following steps:

1. "Two-Step" Approval: Implement a two-step approval process for changes to critical server configurations. This ensures that more eyes are on the dance routine before it's executed.

2. Backstage Pass: Regularly back up critical configuration files, allowing us to undo any unplanned twirls and spins.

3. Monitor the Dance Floor: Enhance the monitoring system to spot any unexpected dance moves in configuration files and notify us promptly.

4. Automate the Waltz: Explore automation to make configuration changes as smooth as a waltz, reducing manual errors.

5. Document the Choreography: Maintain detailed documentation of server configurations and changes for a smooth rehearsal before the performance.

With these measures, we aim to ensure that our servers continue to waltz their way to a seamless and error-free performance, leaving the tango for the dance floor, not the data center. 💃🕺
