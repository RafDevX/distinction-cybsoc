#import "template.typ": cover_page, header, footer, setup_page

#let title = [Legal Memorandum]
#let subtitle = [on the development of a comprehensive Cybersecurity Policy]
#let date = [December 2023]

#cover_page(title: title, subtitle: subtitle, date: date)

#pagebreak()

#show: setup_page

#set page("a4", header: header(title: title), footer: footer)
#counter(page).update(1)

#let refs = (
  gdpr: ["General Data Protection Regulation" (EU Regulation 2016/679), #link(
      "https://eur-lex.europa.eu/legal-content/EN/TXT/HTML/?uri=CELEX:02016R0679-20160504",
    )[eur-lex.europa.eu]],
  nis2: ["NIS 2 Regulation" (EU Regulation 2022/2555), #link(
      "https://eur-lex.europa.eu/legal-content/EN/TXT/?uri=CELEX%3A32022L2555",
    )[eur-lex.europa.eu]],
  csa: ["Cybersecurity Act" (EU Regulation COM/2019/881), #link(
      "https://eur-lex.europa.eu/legal-content/EN/TXT/?uri=CELEX%3A32019R0881",
    )[eur-lex.europa.eu]],
  cra: ["Cyber Resilience Act" (Proposed EU Regulation COM/2022/454), #link(
      "https://eur-lex.europa.eu/legal-content/EN/TXT/?uri=celex:52022PC0454",
    )[eur-lex.europa.eu]],
  ehdr: ["European Health Data Regulation" (Proposed EU Regulation COM/2022/197), #link(
      "https://eur-lex.europa.eu/legal-content/EN/TXT/?uri=celex%3A52022PC0197",
    )[eur-lex.europa.eu]],
  cer: ["Critical Entities Resilience Directive" (EU Directive 2022/2557), #link("https://eur-lex.europa.eu/eli/dir/2022/2557/oj")[eur-lex.europa.eu]],
  cfreu: ["Charter of Fundamental Rights of the European Union" (2000), #link(
      "https://www.europarl.europa.eu/charter/pdf/text_en.pdf",
    )[europarl.europa.eu]],
)

= Introduction

This legal memorandum serves as a basis for the development of a comprehensive
Cybersecurity Policy for our hospital, which must contain and describe certain
elements in accordance with the law, particularly on an European Union level.
There are several different laws that must be taken into consideration when
designing a cybersecurity policy (including proposed laws, for future-proofing
of the policy), and this memorandum attempts to highlight three concrete
cybersecurity objectives that such laws stress, particularly in regard to our
context as a public, large-scale hospital.

In regard to the legislation itself, the General Data Protection Regulation
(GDPR) applies because we process personal data (e.g., related to patients and
employees) by automated means and/or in regard to a filing system#footnote[Article 2(1), see also definition of "personal data" in Article 4 - #refs.gdpr],
and none of the exceptions in its Article 2(2) apply. In particular, data
concerning health is a special category of personal data that requires
additional care#footnote[Article 9 - #refs.gdpr]. Moreover, we determine the
purpose and means of processing of personal data, which qualifies the hospital
as a data controller#footnote[Article 4, definition of "controller" - #refs.gdpr],
which subjects us to additional requirements.

The Network and Information Systems 2 Directive (NIS 2) also applies because a
disruption of our service could have a significant impact on public health#footnote[Article 2(2)(c) - #refs.nis2],
and this Directive establishes several obligations that must be kept in mind,
besides including Recitals that help provide a clue as to how those obligations
might be met and of what measures we may take to fulfill the requirements it
sets forth. It also determines that we are in a sector of High Criticality, due
to being a healthcare provider#footnote[Annex I(5) - #refs.nis2]. Additionally,
NIS 2 provides a legal requirement for the existence of such a cybersecurity
policy as the one that is the matter of this memorandum#footnote[Article 21(2)(a) and (f) - #refs.nis2].
Finally, the European Health Data Regulationn (EHDR) also applies to us, due to
the sector we are in.

In this memorandum, three essential objectives are outlined: privacy and data
confidentiality, data and service availability, and effective incident detection
and response.

= Objective A: Privacy and Data Confidentiality

Operating at the core of the healthcare sector, our hospital must necessarily
deal with personal data in order to efficiently and effectively provide the
noble service it promises to perform. This data can take the form of employee
personal information, as is the case in most organizations, but it can also
comprise sensitive patient information and medical records that must be kept
private at all costs. It is both a moral and legal imperative that all collected
personal data is adequately safeguarded and cannot be accessed by unauthorized
parties, as the right to the protection of personal data is enshrined in the
Charter of Fundamental Rights of the European Union#footnote[Article 8(1) - #refs.cfreu],
by which Sweden is bound.

Thus, it is paramount that our cybersecurity policy reflects our duty to ensure
the confidentiality of all the data we collect and maintain. We must have
effective access control mechanisms#footnote[Article 21(2)(i) - #refs.nis2] that
mediate all requests to access a resource and only authorize them if there is a
legitimate need - e.g., only a patient's physician and attending nurses can be
allowed to access their clinical information. GDPR mandates that we "implement
appropriate technical and organizational measures to ensure a level of security
appropriate to the risk"#footnote[Article 32(1) - #refs.gdpr], and requires that
data is not made accessible "to an indefinite number of natural persons"#footnote[Article 25(2) - #refs.gdpr],
so it is important that all systems are configured to be as strict as possible,
and using whitelist strategies rather than blacklist ones.

There must also be organizational processes that regularly review#footnote[Article 24(1) - #refs.gdpr] the
conditions under which access is granted to each type of resource, and rules
should be role and context based to the greatest possible extent (e.g., the list
of current patients per room should be accessible by the on-duty Head Nurse in
that wing, not a specific Nurse Jane Doe who usually holds that position nor all
the Head Nurses of all hospital wings). Additionally, the cybersecurity policy
must detail off-boarding processes to ensure former employees, employees on
vacation, or those in similar situations forfeit all their access privileges
(permanently or temporarily, depending on the situation).

In addition, we can only rely on authorization if authentication is also
properly implemented, which means all systems must be able to verify that a
request was performed by a specific person#footnote[Article 5(1) and Annex I §1(3)(b) - #refs.cra] (and
therefore conclude whether the request should be authorized or not based on that
person's legal right to access the information). In practice, this calls for
measures such as having strong password policies and requiring Multi-Factor
Authentication#footnote[Article 21(2)(j) - #refs.nis2], as well as having proper
network segmentation to ensure users can only login at the expected locations
and through the expected means#footnote[Article 21(2) and Recital 89 - #refs.nis2].
The cybersecurity policy must also specify specific measures to ensure data is
secure even when the principle of complete mediation cannot be applied (i.e.,
when the normal data request avenues are bypassed), such as mandating encryption
at rest and encryption in transit#footnote[Article 5(1) and Annex 1 §1(3)(c) - #refs.cra] with
keys that are kept securely and inaccessible, and/or other cryptographic
measures#footnote[Article 21(2)(h) - #refs.nis2].

Appropriate steps must also be taken to safeguard, to the highest possible
degree, the security of all third-party dependencies and supply-chain providers#footnote[Article 21(2)(d) and Article 21(3) - #refs.nis2],
such as requiring recognized security certifications for all external products
used - for example, our cybersecurity policy could require certifications as
regulated by ENISA in accordance with the Cybersecurity Act#footnote[Article 4(6) - #refs.csa],
and further restrict that only certificates with a certain assurance level#footnote[Article 52(1), (5), (6) and (7) - #refs.csa] (consistent
with an in-depth risk analysis and a data protection impact assessment#footnote[Article 35(1) - #refs.gdpr])
be accepted. The policy must also require that such products have been subjected
to the legally-required conformity assessments for essential entities#footnote[Article 6(4), Article 24(3), and Annex III Class II(13) - #refs.cra] and,
if dealing with personal electronic health data (as per EDHR#footnote[Article 5(1) - #refs.ehdr]),
conformity assessments for health data processing#footnote[Chapter 3 - #refs.ehdr].

Finally, it is essential that we adopt policies promoting cybersecurity
awareness and train employees#footnote[Article 20(2) and Article 21(2)(g) - #refs.nis2] to
alert them to the dangers of phishing and social engineering attacks: as much as
we try to adapt our systems, it is nigh impossible to distinguish between a
legitimate action performed by a legitimate user out of their own volition, or
one that they have been influenced into performing for someone else who is not
authorized. This is also highlighted in Recital 89 of NIS 2, and it is crucial
that the hospital's cybersecurity policy has a focus on the "people" aspect of
security, rather than just on technology.

These measures, among others, are fundamental in protecting confidentiality and
are required in accordance with NIS 2#footnote[Article 21(2) - #refs.nis2],
besides falling within the scope of the risk-appropriate measures generically
mandated by GDPR#footnote[Article 5(1)(f), Article 25 and Article 32 - #refs.gdpr].

= Objective B: Data and Service Availability

Hospitals are vital hubs that serve some of society's most fundamental interests
through direct healthcare intervention that is a cornerstone of the basic
respect for human dignity, in addition to several other central rights
established by the Charter of Fundamental Rights of the European Union#footnote[Article 1, Article 2, and Article 35 - #refs.cfreu].
Due to their essential role in civilization, as well as the urgency that is
inherently tied to its very nature, it is paramount for hospitals to have
constant availability and be permanently capable of making use of any and all of
their resources, as any eventual downtime can prove fatal to the most vulnerable
members of the population. As hospitals are more and more digitized, the failure
of networks and information systems can easily lead to the hospital's service
becoming severely hindered or even impossible, such as if medical staff are
unable to access the medical history of an unconscious patient and cannot know
what care to safely administer.

In terms of availability, it is important that our cybersecurity policy reflects
the need for replication and redundancy, with data being kept in multiple
distinct places, secure and isolated from each other, but also easily accessible
so replicas can be put in operation at any given moment. This also applies to
digital systems and services themselves, as a malfunctioning (or
non-functioning) system - that is, the cybersecurity policy must mandate regular
reviews of the network and information systems' architecture and require any
identified bottlenecks or single points of failure to be replaced by a redundant
solution without undue delay. Substitute servers and service interfaces for
critical systems must be continuously prepared to suddenly be commissioned by
uptime-aware load balancers that can detect which replicas are available and
which are not.

Additionally, proper network segmentation must be in place#footnote[Article 21(2) and Recital 89 - #refs.nis2] to
reduce the hospital's attack surface and make denial of service attacks
(distributed or not) as infeasible as possible#footnote[Article 5(1) and Annex I §1(3)(f) - #refs.cra] -
no critical information systems should be exposed to the public internet or to
guest networks used by patients and visitors. As appropriate, the cybersecurity
policy should also require the constant operation of firewalls, an Intrusion
Detection System (IDS), and/or an Intrusion Prevention System (IPS) that can
detect denial of service attempts and block them, therefore preventing them from
resulting in failure of availability, even if triggered from inside the internal
network against critical systems. These software tools, if used, should be
required by the cybersecurity policy to have been subjected to a conformity of
assessment#footnote[Article 6(4), Article 24(3), and Annex III Class II(13) - #refs.cra] by
the manufacturer (including in regard to such products "[minimizing] their own
negative impact on the availability of services provided by other devices or
networks"#footnote[Article 5(1) and Annex I §1(3)(g) - #refs.cra]), and should
not process electronic health personal information (as per EDHR#footnote[Article 5(1) - #refs.ehdr])
in order to promote data minimization and reduce the attack surface related to
such data (however, if they must process it for a measurable risk decrease for
the hospital's security, they should have also been subjected to conformity
assessments specific to health data processing#footnote[Chapter 3 - #refs.ehdr]).

Moreover, in order to safeguard availability, the physical conditions
surrounding the hospital's digital systems and infrastructure must be
considered, as the latter's uptime is directly dependent on the former. The
cybersecurity policy must integrate with the hospital's resilience policy and
the technical, security, and organizational measures implemented to "ensure
adequate physical protection of their premises and critical infrastructure"#footnote[Article 13(1)(b) - #refs.cer] -
in particular, the cybersecurity policy should assert specific requirements that
must be fulfilled by such a resilience policy, particularly in terms of physical
security surrounding the facilities where critical digital systems are hosted,
and also in terms of contingency measures such as generators that can support
such systems in event of an electricity grid failure.

In regards to the security of data itself, in order to ensure its long-term
availability, it is crucial for the cybersecurity policy to mandate backup
procedures to be conducted regularly, both to short-term easy-access and
long-term isolated storage means (e.g., respectively, separate hard-drives in
the hospital's data center, and magnetic tapes in a secure warehouse in another
city) - nonetheless, regardless of ease of physical access, all data backup
systems should be air-gapped from the rest of the hospital's network and digital
systems. This behavior is consistent with compliance with GDPR, as it requires
the implementation of appropriate technical and organizational measures to
ensure "
the ability to restore the availability and access to personal data in a timely
manner in the event of a physical or technical incident"#footnote[Article 32(1)(c) - #refs.gdpr].
It is also important for backups to be routinely verified by attempting to use
them in system restoration tests, in order to assure that, in case of an
incident, they can be of use in order to restore data availability.
Additionally, if physical security is sufficiently reliable following a
GDPR-mandated data protection impact assessment#footnote[Article 35(1) - #refs.gdpr],
paper copies of the essential information should be kept as well, so that data
availability is safeguarded in case of a failure of digital systems.

The need for availability must be considered in order to comply with NIS 2#footnote[Article 21(2)(c) - #refs.nis2] and
the Cyber Resilience Act#footnote[Article 5(1) and Annex I §1(3)(f) - #refs.cra],
and the measures outlined above are imperative in order to ensure that our
hospital remains fully operational even during the most adverse of the
situations.

= Objective C: Effective Incident Detection and Response

Given the importance necessarily associated with hospitals as critical
infrastructure, it is crucial that we are able to effectively detect any
on-going attacks and respond to them with the shortest possible delay,
particularly due to essential services commonly being targeted by threat actors
with high capabilities, such as financial-motivated attackers attempting to
perform a ransomware attack, as industries with high availability requirements
are more likely to pay ransoms. The requirement for a quick and effective
response to an incident (and the detection that necessarily precedes it) is set
forth by GDPR#footnote[Article 32(1)(c) - #refs.gdpr] and NIS 2#footnote[Article 21(2)(b) - #refs.nis2],
and it is also indispensable in mitigating problems with regard to
confidentiality and availability, the two other objectives discussed in this
memorandum, as cyber-attacks are often purposely designed to compromise those
properties, among others.

In order to promote incident detection, all systems must engage in logging and
provide monitoring information regarding their internal activities that may be
prove relevant to the hospital's overall security#footnote[Article 5(1) and Annex I §1(3)(j) - #refs.cra],
and the hospital's cybersecurity policy must require that only such products are
used, in addition to specifying testing procedures to be executed routinely in
order to ensure logging remains fully functional, especially after software
updates. Additionally, mechanisms must be put in place to collect all the
generated logs and monitoring data, and frequently (as close to real time as
feasible) analyze them (both individually and in terms of the correlations
between data points, intra- and inter-stream), in order to attempt to detect
potential attacks and deal with them directly and/or, if necessary, escalate
them to a team of on-call human professionals that can verify the situation
respond accordingly.

Moreover, besides asserting the need for constant improvement of response
capabilities, the cybersecurity policy must require or directly establish clear
procedures and policies for incident handling#footnote[Article 21(2)(a) and (b) - #refs.nis2],
including which positions within the organizational structure are responsible
for which tasks, and within what timelines.

In case an incident is detected, NIS 2 requires that any significant incident
(as thereby defined#footnote[Article 23(3) - #refs.nis2]) is reported to
Sweden's CSIRT _(CERT-SE)_ without undue delay#footnote[Article 23(1) and (4) - #refs.nis2],
which includes, where applicable, at least three reports (before 24 hours, 72
hours, and one month have elapsed since the incident detection). Additionally,
if the incident comprises a personal data breach and is "not unlikely to result
in a risk to the rights and freedoms of natural persons", GDPR requires that
incidents are reported to the competent supervisory authority (in this case,
Sweden's _Datainspektionen_) within 72 hours#footnote[Article 33(1) - #refs.gdpr].
The cybersecurity policy and the incident handling procedures as described must
take these responsibilities into account and assure for their fulfillment.

In addition, all the knowledge obtained from the process of incident detection
and response should be shared with other entities, if deemed beneficial for the
cybersecurity community and society at large (especially in regard to other
essential entities and critical infrastructure) - the cybersecurity policy
should specify how that can take place, especially through a basis of a
voluntary exchange of information between essential and important entities#footnote[Article 29 and Recital 119 - #refs.nis2].
In particular, if the hospital discovers vulnerabilities that may affect other
entities or users, the cybersecurity policy should describe specific procedures
to promote their responsible disclosure with the community#footnote[Article 21(2)(e) - #refs.nis2].

= Conclusion

In conclusion, the objectives outlined in this memorandum are essential
(legally, morally, and operationally) to be kept in consideration during the
development of a cybersecurity policy for our hospital, and there are several
measures that should be specified by such a policy in accordance with the
principle of proportionality that is inherent to these matters and the
legislation that accompanies it.

In order to safeguard society's interests, protect and maintain the hospital's
operability and reduce its legal liability, the principles here described should
be reflected in a cybersecurity policy.