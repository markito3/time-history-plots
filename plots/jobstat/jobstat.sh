#!/bin/bash
time=`date +%s`
jsout=/tmp/jobstat_output.txt
jobstat_data_file=/group/halld/time_history_data/jobstat.txt
rm -f $jsout
/site/bin/jobstat | grep -v JOB_ID > $jsout
total=`grep ' R ' $jsout | wc -l`
production=`grep ' R ' $jsout | grep production | wc -l`
general=`grep ' R ' $jsout | grep general | wc -l`
priority=`grep ' R ' $jsout | grep priority | wc -l`
gxp=`grep ' R ' $jsout | grep gxproj | wc -l`
gxp1=`grep ' R ' $jsout | grep gxproj1 | wc -l`
gxp2=`grep ' R ' $jsout | grep gxproj2 | wc -l`
gxp3=`grep ' R ' $jsout | grep gxproj3 | wc -l`
gxp4=`grep ' R ' $jsout | grep gxproj4 | wc -l`
gxp5=`grep ' R ' $jsout | grep gxproj5 | wc -l`
gxp6=`grep ' R ' $jsout | grep gxproj6 | wc -l`
gxp7=`grep ' R ' $jsout | grep gxproj7 | wc -l`
gxp8=`grep ' R ' $jsout | grep gxproj8 | wc -l`
hdusers=`grep ' R ' $jsout | grep \
    -e ' marki ' \
    -e ' davidl ' \
    -e ' elton ' \
    -e ' ent ' \
    -e ' jonesrt ' \
    -e ' cmeyer ' \
    -e ' eugenio ' \
    -e ' abbottd ' \
    -e ' boeglinw ' \
    -e ' chandra ' \
    -e ' pavel ' \
    -e ' brash ' \
    -e ' cuevas ' \
    -e ' jastrzem ' \
    -e ' barbosa ' \
    -e ' carman ' \
    -e ' gurjyan ' \
    -e ' timmer ' \
    -e ' zisis ' \
    -e ' staylor ' \
    -e ' remitche ' \
    -e ' ckourk ' \
    -e ' shepherd ' \
    -e ' ostrov ' \
    -e ' gen ' \
    -e ' zihlmann ' \
    -e ' whitey ' \
    -e ' huttonc ' \
    -e ' mikewood ' \
    -e ' lorelei ' \
    -e ' fklein ' \
    -e ' somov ' \
    -e ' wcrahen ' \
    -e ' flood ' \
    -e ' herun ' \
    -e ' pawel ' \
    -e ' fmartin ' \
    -e ' biallas ' \
    -e ' stevensm ' \
    -e ' weihl ' \
    -e ' heckman ' \
    -e ' gluex ' \
    -e ' kross ' \
    -e ' semenov ' \
    -e ' stepi ' \
    -e ' vtarasov ' \
    -e ' zorn ' \
    -e ' carstens ' \
    -e ' ballard ' \
    -e ' wissmann ' \
    -e ' pentchev ' \
    -e ' sachlebe ' \
    -e ' yqiang ' \
    -e ' heck ' \
    -e ' moffit ' \
    -e ' heddle ' \
    -e ' wmoore ' \
    -e ' lgan ' \
    -e ' nsparks ' \
    -e ' stanisla ' \
    -e ' romanov ' \
    -e ' hovanes ' \
    -e ' spiegel ' \
    -e ' dwbennet ' \
    -e ' creel ' \
    -e ' schneide ' \
    -e ' halldusers ' \
    -e ' kmoriya ' \
    -e ' senderov ' \
    -e ' glamazdi ' \
    -e ' wilevine ' \
    -e ' beizer ' \
    -e ' jem ' \
    -e ' ivantol ' \
    -e ' pmatt ' \
    -e ' gasparan ' \
    -e ' dickover ' \
    -e ' miskimen ' \
    -e ' berdnik ' \
    -e ' nerses ' \
    -e ' leckey ' \
    -e ' harris ' \
    -e ' sandoval ' \
    -e ' romanip ' \
    -e ' sipm_daq ' \
    -e ' kakoyan ' \
    -e ' njarvis ' \
    -e ' rryan ' \
    -e ' beattite ' \
    -e ' pooser ' \
    -e ' jrsteven ' \
    -e ' sdobbs ' \
    -e ' hdsys ' \
    -e ' kliv ' \
    -e ' ilarin ' \
    -e ' sergpozd ' \
    -e ' zhorvath ' \
    -e ' dalton ' \
    -e ' natalie ' \
    -e ' aebarnes ' \
    -e ' bpratt ' \
    -e ' mokaya ' \
    -e ' jamesm ' \
    -e ' letta ' \
    -e ' salgado ' \
    -e ' osoto ' \
    -e ' aszczepa ' \
    -e ' cesar ' \
    -e ' pguo ' \
    -e ' danilkin ' \
    -e ' mengshi ' \
    -e ' furletov ' \
    -e ' ewolin ' \
    -e ' jpond ' \
    -e ' manlara ' \
    -e ' wmcginle ' \
    -e ' mstaib ' \
    -e ' fengj ' \
    -e ' dugger ' \
    -e ' mvick ' \
    -e ' jochen ' \
    -e ' droman ' \
    -e ' schwarz ' \
    -e ' klaus ' \
    -e ' nerling ' \
    -e ' cfanelli ' \
    -e ' boiarino ' \
    -e ' mpatsyuk ' \
    -e ' zhangzy ' \
    -e ' amber ' \
    -e ' beng ' \
    -e ' juliette ' \
    -e ' werthm ' \
    -e ' mack ' \
    -e ' scole ' \
    -e ' rossi ' \
    -e ' aaustreg ' \
    -e ' henschec ' \
    -e ' senrui ' \
    -e ' tingxiao ' \
    -e ' shirs ' \
    -e ' gabyrod ' \
    -e ' rpedroni ' \
    -e ' jpcrafts ' \
    -e ' kevincos ' \
    -e ' voskania ' \
    -e ' igor ' \
    -e ' nacer ' \
    -e ' wphelps ' \
    -e ' lguo ' \
    -e ' jlulou ' \
    -e ' robertej ' \
    -e ' terbora ' \
    -e ' ritchie ' \
    -e ' jritman ' \
    -e ' lng ' \
    -e ' qinn ' \
    -e ' cjbanks ' \
    -e ' tbritton ' \
    -e ' gkalicy ' \
    -e ' lubovit ' \
    -e ' marukyan ' \
    -e ' hans ' \
    -e ' acernst ' \
    -e ' huberg ' \
    -e ' dgi ' \
    -e ' svsomov ' \
    -e ' goity ' \
    -e ' hamlet ' \
    -e ' marq ' \
    -e ' ppauli ' \
    -e ' munoz ' \
    -e ' jdmoody ' \
    -e ' sober ' \
    -e ' hdops ' \
    -e ' ebode ' \
    -e ' ikuznets ' \
    -e ' yunjiey ' \
    -e ' avetik ' \
    -e ' brooksw ' \
    -e ' serguei ' \
    -e ' hayk ' \
    -e ' kagnanvo ' \
    -e ' rpflynn ' \
    -e ' baalouch ' \
    -e ' nwickjlb ' \
    -e ' michaelm ' \
    -e ' akhanal ' \
    -e ' mmccrack ' \
    -e ' andrsmit ' \
    -e ' azaytsev ' \
    -e ' susansch ' \
    -e ' amaryan ' \
    -e ' haoli ' \
    -e ' biggs ' \
    -e ' sterling ' \
    -e ' zbaldwin ' \
    -e ' danielst ' \
    -e ' ahurley ' \
    -e ' keithb ' \
    -e ' jrodrig ' \
    -e ' ahmedali ' \
    -e ' gleasonc ' \
    -e ' dchri ' \
    -e ' liubj ' \
    -e ' hornt ' \
    -e ' sfegan ' \
    -e ' bmck ' \
    -e ' mont ' \
    -e ' stuart ' \
    -e ' rupesh ' \
    -e ' ksuresh ' \
    -e ' billlee ' \
    -e ' dzile ' \
    -e ' churaman ' \
    -e ' omcortes ' \
    -e ' zhaog ' \
    -e ' agoncalv ' \
    -e ' acschick ' \
    -e ' shizak ' \
    -e ' caoning ' \
    -e ' admassu ' \
    -e ' tomcole ' \
    -e ' kimchan ' \
    -e ' tcblack ' \
    -e ' aschertz ' \
    -e ' irrigw ' \
    -e ' satogata ' \
    -e ' heyes ' \
    -e ' yhtan ' \
    -e ' thiel ' \
    -e ' barlowj ' \
    -e ' zhouqiao ' \
    -e ' dlersch ' \
    -e ' lteigrob ' \
    -e ' jgiroux ' \
    -e ' sgryba ' \
    -e ' jzarling ' \
    -e ' braydo ' \
    -e ' alghoul ' \
    -e ' tsaris ' \
    -e ' deurpam ' \
    -e ' adesh ' \
    -e ' ochoa ' \
    -e ' amfoda ' \
    -e ' cpromero ' \
    -e ' mkamel ' \
    -e ' shankar ' \
    -e ' romendez ' \
    -e ' rmontgom ' \
    -e ' gavalian ' \
    -e ' reinhard ' \
    -e ' crede ' \
    -e ' gvasil ' \
    -e ' ebarriga ' \
    -e ' jvega ' \
    -e ' bcannon ' \
    -e ' robison ' \
    -e ' jmhardin ' \
    -e ' rebars ' \
    -e ' cakondi ' \
    -e ' mboer ' \
    -e ' fcal ' \
    -e ' maj ' \
    -e ' karki ' \
    -e ' reinhold ' \
    -e ' amh ' \
    -e ' msahmad ' \
    -e ' briscoe ' \
    | wc -l`
echo $time,$total,$production,$general,$priority,$gxp,$gxp1,$gxp2,$gxp3,$gxp4,$gxp5,$gxp6,$gxp7,$gxp8,$hdusers >> $jobstat_data_file
