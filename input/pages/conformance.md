---
title: Conformance
layout: default
active: conformance
---

<!-- {:.no_toc} -->

<!-- TOC  the css styling for this is \pages\assets\css\project.css under 'markdown-toc'-->

* Do not remove this line (it will not be displayed)
{:toc}

# IPS Document conformance

<div>
To conform to the IPS standard, a patient summary shall be an IPS Document, comprising five mandatory IPS Data Blocks. One additional, required IPS Data Block, is conditional on the need for any cross border application for the IPS.
<p>
The six mandatory IPS Data Blocks within the IPS Document are:
* Patient Attributes	(‘Patient’s name’ from the Collection)
* Allergies and Intolerances
* Medication Summary
* Problems
* Provenance (‘Date of IPS Document Creation’ from the Collection)
* Cross Border (conditional) An Attribute Collection Data Block is mandatory if an attribute within it is mandatory.
</div>
<div>
For cross-border applications only, a conformant IPS Document shall contain the IPS Cross Border metadata as the sixth required data element.
A conformant IPS Document may contain optional IPS Data Blocks, which are also defined in this standard.
A conformant IPS Document may also include non-IPS components if required.  However, the non-IPS components are outside of the scope of this standard and are undefined in this standard and therefore no conformance for them from this document is possible.
Individual IPS Data Blocks can be used in non-IPS patient summaries providing a limited conformance to the IPS Data Set but for full conformance to this IPS standard, the IPS Document shall comprise at least the required IPS data elements specified in this clause and have the same purpose as a summary extracted from the patient’s recorded history.
The IPS Document structure is essentially hierarchical.  Whereas the hierarchical relationships between data elements are significant in terms of requirement, the order of sibling elements is arbitrary and has no requirement for any implementation.
</div>

# IPS Conformance Detail
<div>
The Following Table shows the shorthand abbreviations for these and describes what they mean with respect to the different types of IPS data element.   That having been said, the data element conformance information has been derived from HL7 and IHE semantics, which illustrate ways of representing data for transmission and receipt to ensure consistency.
A compliant model or a conformant implementation shall also:
* Share the same scope of the IPS. Note, a Discharge Summary, although a type of continuity care document, does not have the same purpose as a patient summary and is not an IPS, although it can use the IPS Data Blocks as required.
* Declare, if not self-evident, how the data patterns defined in section 6.3 of EN 17269 are realized.
* Fulfil the conformance rules, as described by the following table, for the IPS Data Blocks and elements specified in section 7 Definition of the IPS Document or IPS.
</div>

## Table — Requirement Descriptors for IPS Document, Section types and Metadata

| Value | Description | Comment |
| M | Mandatory (exceptions not allowed) | A mandatory element shall always be present and - where applicable - shall be valorised with valid values. No exceptions or empty/null values are allowed in this case. If it refers to a composite element (e.g. a section, a list; a label concept) the presence of the included elements is determined by the conformance rules of these sub-elements. Recipient shall understand mandatory elements. If a ‘mandatory’ element is missing then the document is no longer a conformant IPS. A derived model (that includes also implementable specifications) shall maintain an equivalent conformance strength. |
| R | Required (exceptions allowed) | A required element shall always be present and - where applicable - should be valorised with valid values. Exceptions or empty/null values are allowed in this case. If it refers to a composite element (e.g. a section, a list; a label concept a complex data type) the presence of the included elements is determined by the conformance rules of these sub-elements. Recipient shall understand required elements. If a ‘required’ element is missing then the document is no longer a conformant IPS. A derived model (that includes also implementable specifications) shall maintain an equivalent conformance strength; or may further constrain it (e.g. from ‘R’ to ‘M’). |
| RK | Required, if known | A “Required if known” element is one that should be provided. If there is information available, the element must be present and - where applicable - valorised with valid values. If there is no information available, the element may be omitted, may be left empty, or may be valorised with exceptional or null values depending on the implementation. If it refers to a composite element (e.g. a section, a list, a label concept, a complex data type) the presence of the included elements is determined by the conformance rules of these sub-elements. Recipient shall understand required elements. A derived model (that includes also implementable specifications) shall maintain an equivalent conformance strength; or may further constrain it (e.g. from ‘RK’ to ‘R’). |
| C | Conditional (has associated condition predicates) | Depending on predicate conditions the element may assume different conformance strengths (e.g. O, R, RK) or not being present. A predicate can be simple (for example: «element A exists»; «attribute b = value1») or complex (for example: «element C exists» AND «the attribute x of element D = value2). A conditional element may be evaluated on a single condition (if predicate A then ‘Required’ else ‘Optional’) or on multiple conditions (e.g. if predicate A then ‘Required’; if predicate B then ‘Optional’; else ‘Not Present’). The resulting conformance strength (M, R, RK, O, ...) is determined by the conditions. If it refers to a composite element (e.g. a section, a list, a label concept, a complex data type) the presence of the included elements is determined by the combination of the predicate conditions of this element and the conformance rules of its sub-elements. For example: 1.	no exception is raised if a required sub-element is missing, when the parent is correctly omitted. 2.	an exception is raised if a required sub-element is missing, when the parent is present. Derived models or implementable specifications shall maintain an equivalent conformance strength; but it is allowed to modify the conformance strength if the predicate condition permits. Recipient shall understand conditional elements, when required. For example, a conditional element that could be optional or not present could be omitted by a derived model and ignored by a recipient. Or, a condition for which a conditional element become required doesn’t apply to a jurisdiction, in that case a jurisdictional specification could omit that element and recipient could ignore it. Depending on the conditions, exception is or is not raised if the data are missing. |
| O | Optional | This data element can be omitted from a derived model, including from implementations. Recipient may ignore optional elements. If it refers to a composite element (e.g. a section, a list, a label concept, a complex data type) the presence of the included elements is determined by the presence of this element and the conformance rules of its sub-elements. For example, no exception is raised if a required sub-element is missing, when the parent is omitted. The reason for specifying the optional data elements is to ensure that both sender and recipient use the appropriate semantic interpretation of these elements. No exception is raised if the data are missing. |

