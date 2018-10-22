variable "owner_id" {
    default = "pitviper"
}
data "template_file" "iam_policy" {
    template = "${file("${path.module}/templates/iam_policy.json.tpl")}"
    vars {
        bucket_name = "${var.owner_id}-${uuid()}"
    }
}
output "iam_policy" {
    value = "${data.template_file.iam_policy.rendered}"
}