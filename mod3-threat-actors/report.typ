#let title = [The Viasat Hack: Analysis Report]
#let kthblue = rgb("#004791")

#set page("a4", header: {
  set text(10pt)
  smallcaps[#title]
  h(1fr)
  smallcaps[DD2510 - Module 3]
  line(length: 100%, stroke: 0.5pt + rgb("#888"))
}, footer: {
  set text(10pt)
  line(length: 100%, stroke: 0.5pt + rgb("#888"))
  smallcaps[Rafael Serra e Oliveira]
  h(1fr)
  [Page ]
  counter(page).display("1 of 1", both: true)
})
#set par(justify: true)

#align(
  center,
)[
  = #underline(title)
  == DD2510 Cybersecurity in a Socio-Technical Context
  === Module 3: Threat Actors in a Socio-Technical Context
  ==== #smallcaps(text(fill: kthblue, [KTH Royal Institute of Technology, January 2024]))
  #v(7pt)
  *Rafael Serra e Oliveira (#link("mailto:rmfseo@kth.se", "rmfseo@kth.se"))*
  #line(length: 60%, stroke: 1.5pt + black)
  #v(7pt)
]

#set heading(numbering: "1.")

= Background and Overview

The _*Viasat Hack*_ was a cyber attack against Viasat's KA-SAT Network that took
place on the 24#super[th] of February 2022 @viasat-press-release-overview and
resulted in a significant disruption with widespread impact. Viasat is a
multi-billion-dollar, global communications company based in California that
provides high-speed satellite connectivity to individuals, companies, and
governments (including for defense and military) @viasat-what-we-do, and within
the scope of its such core business it owns the KA-SAT Network, which comprises
a telecommunications satellite and its related ground infrastructure. KA-SAT is
a key asset for Viasat and allows it to provide high-throughput internet
coverage to Europe and other mediterranean areas, whose markets have come to
rely on the services rendered @viasat-ka-sat - in particular, more remote
regions without cable infrastructure have to resort to satellite technology for
communications.

In short and as a high-level simplification, the KA-SAT network has three main
components and works as follows: customer devices communicate with modems at
their premises (such as a family's home or a company headquarters), which in
turn use a powerful antenna to communicate with the KA-SAT satellite. This
satellite then simply proxies communications to KA-SAT ground stations (gateways
\/ teleports) which have fiber-optic internet connections and thus provide
customers the connectivity they need. In this case, the Viasat Hack focused
almost exclusively on the first of these three high-level components (modems /
satellite / ground stations), impacting primarily the devices in customers'
premises @defcon-viasat.

It is also worth noting that while Viasat owned the KA-SAT network at the time
of the incident, the company had only purchased it recently, so the network was
still being operated by an Eutelsat subsidiary, Skylogic, under a transition
agreement @viasat-press-release-overview. Nevertheless, Viasat was the one
affected in branding, and the one coordinating incident response for this
multi-faceted attack that disrupted communications all over Europe.

Finally, for context, it should also be mentioned that the geopolitical
situation between Russia and Ukraine serves as the backdrop for this hack,
wherein long-standing tensions between the two countries (including after a
Russian annexation of Crimea in 2014 @kremlin-crimea) culminated in Russia's
invasion of Ukraine approximately an hour after this incident @ukraine-invasion.

= Threat and Threat Actor Analysis

== The Threat

The Viasat Hack is frequently described as multifaceted as it consisted, in
reality, of two distinct, coordinated attacks, appearing to be perpetrated by
the same threat actors and happening near-simultaneously, but using two
different methods to disrupt the KA-SAT network @defcon-viasat. The most
prominent and impactful of these was able to wipe (erase the flash memory of)
tens of thousands of customer modems making them inoperable
@viasat-press-release-overview, while the second one caused mild but repeated
network disruptions @defcon-viasat.

=== Attack \#1: AcidRain Wiper Malware

For this attack, Viasat claims that the malicious actors managed to penetrate
KA-SAT's management network using compromised VPN credentials, subsequently
using different sets of compromised credentials to access a network operations
server that was used for KA-SAT diagnostics and monitoring. This server gave the
attackers the necessary access to perform reconnaissance as it had information
on all connected modems, and the former then compromised an FTP server that was
used to push firmware updates to modems, which allowed them to stage the malware
as a legitimate update and use KA-SAT's own supply-chain to install the malware
in customer modems and trigger a reboot, rendering them inoperable (due to
having their memory wiped and thus no filesystem to boot from)
@viasat-press-release-overview.

The malware itself was discovered by SentinelLabs researchers to be _AcidRain_ (which
was later confirmed by Viasat), a wiper designed to target modems and routers in
order to overwrite key flash memory data in hopes of rendering it inoperable and
in need of reflashing or replacing @sentinel-acid-rain.

It is possible to outline this threat using Lockheed Martin's Cyber Kill Chain
@cyber-kill-chain:

+ *Reconnaissance:* collect information on how the KA-SAT network works and find
  compromised credentials for VPN and other services;
+ *Weaponization:* craft the AcidRain wiper malware, a MIPS executable to wipe
  flash memory and erase its partition tables;
+ *Delivery:* breach into KA-SAT's Turin Core Node, stage the malware in its FTP
  server, and push it to the target devices using legitimate commands;
+ *Exploitation:* reaching the modems as a legitimate firmware update, the malware
  is executed in a trusted context;
+ *Installation:* _not applicable as persistent remote control is not required_;
+ *Command and Control:* _not applicable as persistent remote control is not required_;
  and
+ *Actions on Objectives:* erase the modem's flash memory and reboot it so that it
  cannot function.

=== Attack \#2: DHCP Denial of Service

The second attack (in terms of prominence, but actually the first one to be
executed) was a Denial of Service that leveraged a bug in KA-SAT's ground
stations to mislead them into disconnecting modems from the network. Using
legitimate modems with valid identities and subscriptions, the malicious actors
sent DHCP control messages referring to IP addresses being used by the targeted
customer modems - then, KA-SAT's DHCP server would reject the request by sending
the gateway a negative acknowledgment (NAK), but the latter was not adequately
programmed to handle that case and thus ejected the targeted modem from the
network @defcon-viasat. It is unclear how the attackers were able to initiate
this from real, authenticated modems, as there was no clear pattern to them
(including any particular location-based clustering), and it is not known
whether they simply purchased and distributed them or if they somehow
compromised them in another fashion and avoided detection. It should also be
noted that this attack was not a one-off, occurring intermittently over a long
period of time and resorting to slightly-different variants every time Viasat
managed to mitigate each variant.

For this attack, the seven Cyber Kill Chain phases @cyber-kill-chain would be:

+ *Reconnaissance:* analyze how KA-SAT's DHCP works, acquire modems with
  legitimate subscriptions, and scan for target modems on the KA-SAT network;
+ *Weaponization:* craft DHCP messages that target the discovered weakness;
+ *Delivery:* send messages through satellite to gateway, which forwards them to
  the DHCP server;
+ *Exploitation:* have the server reject the request and reply with a NAK to the
  gateway;
+ *Installation:* _not applicable as persistent remote control is not required_;
+ *Command and Control:* _not applicable as persistent remote control is not required_;
  and
+ *Action:* confused, the gateway kicks the target modem off the network,
  rendering it offline.

== The Threat Actor

Researchers have linked the AcidRain malware with the Russian Federation's GRU
directorate, due to close similarities with other malware @sentinel-acid-rain,
which suggests that Russia may have been behind the Viasat Hack. This is also
consistent with the timing of the attack, as it took place around an hour before
Russia invaded Ukraine, and with the fact that no attempt at data exfiltration
was made, showing that the attackers were not financially motivated (nothing was
stolen for ransom or selling).

In addition, it is possible that more evidence of Russian ties was silently
discovered by other governments, as on May 10#super[th] 2022 several states
publicly attributed the hack to Russia and heavily condemned it - this includes
the UK @uk-attribution, the United States @us-attribution, the European Union,
and several other European countries @eu-attribution.

Although the attack almost certainly came from the GRU, there is not a clear
consensus regarding which specific unit (within it) it originated from
("Sandworm" operated by Military Unit 74455, "Fancy Bear" operated by Military
Unit 26165, or others) - as such, since more granularity is not possible, the
threat actor is considered to be the GRU itself. Nevertheless, this attacker has
nation-state capabilities and motivations, and is most likely an Advanced
Persistent Threat (APT), meaning a "well-resourced adversary engaged in
sophisticated malicious cyber activity that is targeted and aimed at prolonged
network/system intrusion" @cisa-apt.

= Political and Socio-Technical Analysis

Although Russia's motives remain a mystery, it is speculated that they simply
wished to disrupt Ukrainian communications during the initial period of the
invasion, in order to cripple the enemy's military response (since they relied
on KA-SAT for military communications @wired-spill) and generate confusion and
chaos for its citizens living in more remote regions, who would be unable to
access information regarding the conflict and communicate with others. This
attack corroborates the fact that cyber is being used in wars, but only with a
supporting role and not as a leading actor.

The key aspect to understand here is, however, that the threat actor favored
impact and speed (as they were likely on a schedule, given the timing), but had
to do so at the expense of precision: despite much of the aftermath being
limited to the Ukraine, thousands of households in other European countries were
affected too, including in Poland, the UK, France, the Czech Republic, Hungary,
Greece, Germany, and Italy. In addition, more than 5,800 wind turbines in
Germany were affected, and after a month \~60% were still offline @wired-spill
@cyberpeace-case-study. This emphasizes the _*spillover effect*_ that is
prevalent within the Viasat Hack, and shows that Russia probably caused more
damage than intended.

This hack can also be classified as a _large-scale cyber incident_, as it had
very serious effects (both in terms of military sabotage, per Ukrainian SSSCIP
@reuters-comms-loss, and with regard to civilians affected as collateral
damage), and is a transboundary crisis, the latter being characterized by not
adhering to conventional boundaries @ansell-transboundary-crisis:

- Political Boundaries: the hack's effects were not limited by geographical
  borders and jurisdictions, affecting thousands of people in different countries;
- Functional Boundaries: all kinds of people and organizations were affected,
  across sectors and regardless of any military affiliation (or lack thereof); and
- Temporal Boundaries: despite there being a clear point in time where the attack
  was most prominent, there is no clear time delimitation on when it began
  (reconnaissance took place beforehand and several questions are still
  unanswered) and when it ended (effects were still felt months after, and it took
  place at a critical moment that likely shaped the war and still has
  repercussions today).

#pagebreak()

In addition, this attack can be analyzed from the perspective of Perrow's Normal
Accidents Theory in its more modern variant applied to Cyber Accidents
@sarah-normal-accidents - we can find evidence of both interactive complexity
and tight coupling for each of the three layers described in the framework:

#{ // scope marker setting
  set list(marker: "‣")
  [
    - Technology:
      #set list(marker: "◦")
      - Complexity: as previously described, the system has many different moving parts
        across three main components, and each (potentially-legacy) part must be kept in
        mind at all times;
      - Coupling: ISPs are critical infrastructure and have little to no allowance for
        downtime, which might prevent maintenance of devices and modules.
    - Organizational:
      #set list(marker: "◦")
      - Complexity: Viasat "found it extremely difficult, especially on older networks,
        to find out what normal behavior was" @cso-lessons-learned;
      - Coupling: better-protected components connected to more-vulnerable components.
    - Macro:
      #set list(marker: "◦")
      - Complexity: Viasat's inter-organizational dependency on Skylogic for operating
        KA-SAT;
      - Coupling: complex supply-chain ecology (e.g., wind turbines, airlines, and
        governments relying on KA-SAT)
  ]
}

Thus, given a system with these system characteristics as described, Normal
Accidents Theory claims that accidents will be more likely, more difficult to
analyze, and more consequential - and the empirical data associated with the
Viasat Hack corroborates this. These NA-dynamics make KA-SAT a risky target, and
any attack can have unpredictable consequences, which is what happened in this
case.

Finally, this incident raises several ethical concerns, such as spillover being
able to cause cyber warfare attacks to affect unintended parties (e.g.,
civilians and neutral sovereign countries), especially when the target exhibits
NA-dynamics. Furthermore, offensive cyber postures with attacks that may have
unpredictable effects cannot guarantee adherence to the principle of
proportionality and may be unwillingly interpreted by others as an escalation.
Moreover, targeting communication networks erodes public trust in digital
technologies and hinders global efforts to promote digitalization, which may
cause setbacks on all levels. Lastly, it should be considered whether it is
ethical for Viasat to host military and civilian entities within the same
infrastructure, as Russia would perhaps not have attacked the latter otherwise,
and in doing this Viasat unwittingly put their customers at risk.

In summary, Russia's February 2022 (dual-)cyber-attack against Viasat's KA-SAT
Network had unpredictable effects that were likely outside of what was
originally intended, leading to a large-scale, transboundary crisis that proved
historic and elicited various ethical considerations.

#pagebreak()
#bibliography("references.yml", title: "References")
