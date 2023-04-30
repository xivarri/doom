;;; Compiled snippets and support files for `cc-mode'
;;; Snippet definitions:
;;;
(yas-define-snippets 'cc-mode
                     '(("bm" "static void BM_${1:Name}(benchmark::State &state) {\n  $0\n  for (auto _ : state) {\n\n  }\n}\n\nBENCHMARK(BM_$1);" "benchmark" nil
                        ("testing")
                        nil "/home/xvs/.doom.d/snippets/cc-mode/benchmark" nil "benchmark")))


;;; Do not edit! File generated at Sat Jul  9 11:11:38 2022
