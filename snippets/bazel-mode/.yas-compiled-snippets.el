;;; Compiled snippets and support files for `bazel-mode'
;;; Snippet definitions:
;;;
(yas-define-snippets 'bazel-mode
                     '(("cct" "cc_test(\n    srcs = [\"${1:test_file}.cc\"],\n    deps = [\":$1\"]\n)\n" "cc_test" nil nil nil "/home/xvs/.doom.d/snippets/bazel-mode/cc_test" nil "cc_test")
                       ("bin" "cc_binary(\n    name = \"${1:target name}\",\n    srcs = [\"$1.cc\"],\n    deps = [\n         $0\n    ],\n)\n" "cc_binary" t nil nil "/home/xvs/.doom.d/snippets/bazel-mode/cc_binary" nil "cc_bin")))


;;; Do not edit! File generated at Sat Jul  9 11:11:38 2022
