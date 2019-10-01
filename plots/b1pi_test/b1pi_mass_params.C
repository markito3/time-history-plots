Int_t func(string rootfile) {
  cout << "rootfile=" << rootfile << endl;
  Int_t status = 0;
  return status;
}

void print_params(TFile *file, string histname) {
  TH1I *x_mass_hist = (TH1I*)file->Get(histname.c_str());
  Double_t entries = x_mass_hist->GetEntries();
  Double_t mean = x_mass_hist->GetMean(1);
  Double_t sigma = x_mass_hist->GetMean(11);
  Double_t rms = x_mass_hist->GetStdDev(1);
  cout << "hist_params:" << histname << ",entries=" << entries << "," << "mean=" << mean << "," << "sigma=" << sigma << "," << "rms=" << rms << endl;
}

void b1pi_mass_params() {
  TFile *F1 = new TFile("/scratch/gluex/b1pi/2019-09-19/Linux_RHEL7-x86_64-gcc4.8.5/11366/hd_root.root");
  print_params(F1, "b1pi/Hist_InvariantMass_Pi0_PostKinFit/InvariantMass");
  print_params(F1, "b1pi/Hist_InvariantMass_omega_PostKinFit/InvariantMass");
  print_params(F1, "b1pi/Custom_HistMass_b1_1235/InvariantMass");
  print_params(F1, "b1pi/Custom_HistMass_X_2000/InvariantMass");
}
