test = {
  'name': 'derive-exp',
  'points': 1,
  'suites': [
    {
      'cases': [
        {
          'code': r"""
          scm> (derive x^2 'x)
          (* 2 x)
          scm> (derive x^3 'x)
          (* 3 (^ x 2))
          scm> (derive (make-sum x^3 x^2) 'x)
          (+ (* 3 (^ x 2)) (* 2 x))
          """,
          'hidden': False,
          'locked': False
        }
      ],
      'scored': True,
      'setup': r"""
      scm> (load 'hw08)
      scm> (define x^2 (make-exp 'x 2))
      scm> (define x^3 (make-exp 'x 3))
      """,
      'teardown': '',
      'type': 'scheme'
    }
  ]
}
