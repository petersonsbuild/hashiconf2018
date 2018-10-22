
provider "aws" {
}
resource "aws_s3_bucket" "bucket1" {
    bucket = "${var.owner_id}-${uuid()}"
    acl = "private"
}
resource "aws_iam_policy" "bucket1"{
    name = "${aws_s3_bucket.bucket1.id}-policy"
    policy = "${data.template_file.iam_policy.rendered}"
}
resource "aws_iam_user_policy_attachment" "attach-policy" {
    user = "${var.owner_id}"
    policy_arn = "${aws_iam_policy.bucket1.arn}"
}
variable "owner_id" {
    default = "tfe-201-training-horse"
}
data "template_file" "iam_policy" {
    template = "${file("${path.module}/templates/iam_policy.json.tpl")}"
    vars {
        bucket_name = "${aws_s3_bucket.bucket1.id}"
    }
}
output "iam_policy" {
    value = "${data.template_file.iam_policy.rendered}"
}