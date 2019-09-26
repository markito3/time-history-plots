{
  TFile *F1 = new TFile("/scratch/gluex/b1pi/2019-09-19/Linux_RHEL7-x86_64-gcc4.8.5/11366/hd_root.root");
  TH1I *x_mass_hist = (TH1I*)F1->Get("b1pi/Custom_HistMass_X_2000/InvariantMass");
  x_mass_hist->Draw();
  Double_t entries = x_mass_hist->GetEntries();
  Double_t mean = x_mass_hist->GetMean(1);
  Double_t sigma = x_mass_hist->GetMean(11);
  Double_t rms = x_mass_hist->GetStdDev(1);
  cout << "time_history,entries=" << entries << "," << "mean=" << mean << "," << "sigma=" << sigma << "," << "rms=" << rms << endl;
  // call a function
  Int_t value = func("/hd_root.root");
}

Int_t func(string rootfile) {
  cout << "rootfile=" << rootfile << endl;
  Int_t status = 0;
  return status;
}
