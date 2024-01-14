#let title = [Equifax Data Breach: Incentives Analysis]
#let kthblue = rgb("#004791")

#set page("a4", header: {
  set text(10pt)
  smallcaps[#title]
  h(1fr)
  smallcaps[DD2510 - Module 2]
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

#align(center)[
= #underline(title)
== DD2510 Cybersecurity in a Socio-Technical Context
=== Module 2: Vulnerabilities in the Use of Systems
==== #smallcaps(text(fill: kthblue, [KTH Royal Institute of Technology, november 2023]))
#v(7pt)
*Rafael Serra e Oliveira (#link("mailto:rmfseo@kth.se", "rmfseo@kth.se"))*
#line(length: 60%, stroke: 1.5pt + black)
#v(7pt)
]

_*Equifax Inc.*_ is one of the largest consumer credit reporting agencies in the world @equifax-annual-report-2022, with their entire business model relying on them owning an enormous trove of personal information with which they can advise banks and other financial institutions on the credit risk and worthiness of specific consumers. As such, it should come as no surprise that Equifax is a prime target for attackers wishing to access the information they own, especially for nefarious purposes --- and, indeed, hackers managed to do so in a 2017 cyber incident that compromised the private records of 147.9 million Americans, 15.2 million British citizens, and 19 000 Canadians.

Equifax has been widely criticized for their handling of the situation, both in terms of insufficient preventive efforts and in relation to their incident response. Regarding the former, although an urgent security patch (fixing the critical vulnerability that would eventually be used as an entry-point into Equifax's network) was released by Apache on March 7#super[th] @apache-release and an Equifax employee was instructed to apply it on the 9#super[th], they did not do so and no one noticed. Moreover, on the 15#super[th], Equifax ran several scans in order to identify vulnerable systems, but the scans were not working properly and although there were multiple such vulnerable systems, none was flagged or patched. Equifax also had tools to inspect encrypted traffic, but they did not work because a necessary certificate had been expired for almost a year without anyone noticing @cso-faq. Additionally, at the same time, the company's relationship with their security consulting firm _Mandiant_ soured (after Mandiant warned Equifax about multiple unpatched and misconfigured systems), which gave the hackers leeway to explore the network and compromise it further over the course of several months, during which they were completely undetected @bloomberg-state-sponsored. In light of all this, the FTC claimed Equifax failed to implement basic security measures @ftc-settlement.

This behavior suggests that Equifax perhaps did not take security seriously enough, down-playing it and not expressing sufficient concern over it. It seems likely that this would be the result of misaligned incentives, with top management believing that prioritizing the business aspects over information security would lead to the best results for the company, especially from a financial point of view.

Such a situation is common, with top managers often failing to see the benefits that would arise from a proper security posture (and the sizeable investment that it necessary entails). This may be because they are not sufficiently well-informed of the risks, because they have personal biases that shield them from accepting and fully believing the veracity and magnitude of these risks, or because there truly are not enough socio-economical incentives to justify it.

Though before this incident Equifax might have lacked some of the incentives to adopt a more proactive cybersecurity posture, it seems now that this attack proved to be a very costly wake-up call, with the company having to spend over \$1.38 billion in fines and consumer compensation @cso-faq, despite being covered by cyber insurance. Now realizing the great monetary incentive behind security, the company announced that they have spent over \$1.5 billion in incident response and upgrading their technical infrastructure @reuters-fine, with major changes related to new technology and data security @bis-breach-cost. This is likely to be an indicator that the credit reporting giant has re-considered their priorities and incentives (in this case, financial), coming to the conclusion that security is more important than they had previously judged it.

There are, however, other types of incentives besides financial ones, or at least entirely financial in nature. In this case, there is no doubt that Equifax's public image as a custodian of personal information was impacted by this incident @equifax-annual-report-2022, with their stock price dropping almost 14% in just the first day of the breach being disclosed (on the 8#super[th] of September 2017, more than a month after being discovered on the 29#super[th] of July when the expired Intrusion Detection System certificate was finally renewed). Several security experts and business analysts have publicly shamed the company, promoting generalized distrust from both individuals and financial institutions (Equifax's most important customers) @wired-response.

The arguably most relevant point to consider, though, is that cyber incidents such as this one can have quite unfavorable effects for society as a whole (i.e., they cause negative externalities), which makes it a prime target for state regulation in the interest of minimizing the risk and consequences for the general population. If there is a strong regulatory force requiring companies to follow best practices, maintain their systems' security, and responsibly disclose any vulnerabilities discovered, that can prove to be a very powerful incentive for them to give sufficient note to the matter of security. This is most effective when it is clear that regulations will be enforced and any violations will result in severe consequences for the violator, therefore forcing top managers to consider this incentive to an investment in security.

Another possible approach would be to offer positive incentives to those that follow the regulations and show a stellar behavior in their preventive and post-incident handling, which could come in the form of tax benefits, legal protections, and priority in procurement calls for public contractors.

If regulations are strengthened in this fashion, with significant punishments for companies that fail to patch known vulnerabilities (especially critical ones), and otherwise relevant benefits if they do patch them, that would most likely provide sufficient incentives for companies to do so and prevent similar (somewhat negligence-driven) incidents from happening in the future. Requirements on disclosure deadlines can also help minimize consequences for affected third parties: for example, in this case, consumers should have been notified as soon as possible so they could have immediately taken appropriate protective measures (such as requesting a credit block to prevent identity fraud).

Evidently there can be challenges involved, such as difficulty to implement and enforce this sort of regulations due to industry push-back (as it goes against their current incentives to maximize short-term financial gains), and it is overall difficult to strike a balance between proper security and undue burden on businesses --- but if implemented correctly, this can have very noticeable effects.

Of course, the context surrounding Equifax in 2017 (and before then) was not devoid of regulation, or they would not have had to pay several hundred million USD in fines and then consumer compensation funding on top of that, but it is clear that the regulatory incentives were not sufficient to warrant the desired consideration prior to the incident actually taking place. This may simply have been because top managers did not grasp the potential magnitude of the consequences, but offering positive regulatory incentives is more likely to be well-perceived and has more certainty associated, which is a relevant factor when companies must at all times balance contradicting forces (in this case, desirable security brings undesirable expenses, which could be offset by near-guaranteed regulatory benefits).

In conclusion, the Equifax 2017 data breach cyber incident serves as a stark reminder of the critical importance of cybersecurity, particularly in industries that handle such vast amounts of personal data. The lax approach to security demonstrated by the credit reporting agency can be attributed to a possible misalignment of socio-economical incentives or a (perceived) lack of sufficient strength in them to encourage behaviors beneficial to society, but Equifax's shift in attitude after suffering the consequences of such a major incident shows newfound recognition of the importance of a proper security posture. A solution for this could be strengthening regulatory measures to encourage security proactivity and responsibility industry-wide, despite the resistance that such measures' implementation process might encounter. In particular, focusing on providing positive incentives might yield better results.

#pagebreak()
#bibliography("references.yml", title: "References")