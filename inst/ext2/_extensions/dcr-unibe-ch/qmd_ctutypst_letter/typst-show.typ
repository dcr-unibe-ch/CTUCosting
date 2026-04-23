#show: ctu_typst_template.with(
$if(subject)$
  subject: "$subject$",
$endif$
$if(subject2)$
  subject2: "$subject2$",
$endif$
$if(department)$
  department: "$department$",
$endif$
$if(faculty)$
  faculty: "$faculty$",
$endif$
$if(recipient)$
  recipient: "$recipient$",
$endif$
$if(header_address)$
  header_address: "$header_address$",
$endif$
$if(address_recipient)$
  address: "$address_recipient$",
$endif$
$if(address_recipient_line1)$
  recipient_line1: "$address_recipient_line1$",
$endif$
$if(address_recipient_line2)$
  recipient_line2: "$address_recipient_line2$",
$endif$
$if(address_recipient_line3)$
  recipient_line3: "$address_recipient_line3$",
$endif$
$if(address_recipient_line4)$
  recipient_line4: "$address_recipient_line4$",
$endif$
$if(address_recipient_line5)$
  recipient_line5: "$address_recipient_line5$",
$endif$
$if(sender)$
  sender: "$sender$",
$endif$
$if(sender_title)$
  sender_title: "$sender_title$",
$endif$
$if(sender_line1)$
  sender_line1: "$sender_line1$",
$endif$
$if(sender_line2)$
  sender_line2: "$sender_line2$",
$endif$
$if(sender_line3)$
  sender_line3: "$sender_line3$",
$endif$
$if(sender_line4)$
  sender_line4: "$sender_line4$",
$endif$
$if(sender_line5)$
  sender_line5: "$sender_line5$",
$endif$
$if(sender_line6)$
  sender_line6: "$sender_line6$",
$endif$
include_sender_right: $if(includesenderright)$$includesenderright$$else$false$endif$,
signoff: $if(signoff)$$signoff$$else$false$endif$,
$if(space_after_recipient)$
  space_after_recipient: $space_after_recipient$, 
$endif$
$if(logo)$
  logo: "$logo$", 
$endif$
$if(logo_size)$
  logo_size: $logo_size$, 
$endif$
$if(logo_size2)$
  logo_size2: $logo_size2$, 
$endif$

)