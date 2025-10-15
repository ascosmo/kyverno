Install Kyverno com TF

#helm install kyverno kyverno/kyverno -n kyverno --create-namespace


#reg.kyverno.io/kyverno/background-controller:v1.15.2

#reg.kyverno.io/kyverno/kyvernopre:v1.15.2  #<<<  Admission Controller
#reg.kyverno.io/kyverno/kyverno:v1.15.2  #<<< Admission Controller, ver qual das duas é o init_container

#reg.kyverno.io/kyverno/cleanup-controller:v1.15.2

#reg.kyverno.io/kyverno/reports-controller:v1.15.2
