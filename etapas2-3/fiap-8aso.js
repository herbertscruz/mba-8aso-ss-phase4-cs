import http from "k6/http";
import { check, sleep } from "k6";

export default function () {
  let res = http.get(
    "http://blog-django-py-git-rm-342971.apps.na46a.prod.ole.redhat.com/"
  );
  check(res, { "success login": (r) => r.status === 200 });
  sleep(0.3);
}
