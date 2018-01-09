FactoryGirl.define do
  factory :article do
    title 'Random title'
    body 'Lorem ipsum dolor sit amet, mel modus assueverit no, et duo accusam noluisse sententiae. An vix rebum
forensibus intellegam. Ei duo illud justo percipitur, vel in modo lucilius. Quo at agam volumus maluisset.
Propriae epicurei aliquando an est, ponderum theophrastus disputationi nam ea. Mei no iisque assueverit, nam at movet
percipit, ius animal lucilius te. Scriptorem scribentur id vis. Vix sanctus scripserit ut. Est id erat eleifend.
Ex case recusabo sea, solet interesset mel cu. Te ius mnesarchum temporibus, sed prompta conceptam vituperatoribus ea,
ius lucilius moderatius ei. Feugiat bonorum quaerendum ut pro. Fugit labitur pertinacia duo et. Tamquam salutandi
efficiantur ad pri. Mei purto expetendis id. Meis erant labores pro te, sea blandit omnesque offendit te, novum
detracto cum ex. Id deleniti efficiantur reprehendunt duo, ne etiam offendit disputationi mel. Mel detraxit molestiae
ei, id per hinc tota iusto. Labitur sapientem eos cu, mei ad urbanitas signiferumque. Mazim rationibus per ei, id
labitur sapientem his. Prima aperiri fierent vis te, pro aliquam delicatissimi ne.'
    picture File.new(File.join(Rails.root + 'spec/fixtures/image.jpg'))
    review_status :done
    category :'ror-development'
    association :member
  end
end
