%global commit 0b5299f5e8aa0dee20562a06c2651c7726bdc807
%global shortcommit %(c=%{commit}; echo ${c:0:7})


Name:           sty-etc
Epoch:          1
Version:        1.0
Release:        1.SS%{?dist}
Summary:        SS custom aliases, colorful tty, crons and config scripts

Group:          System Environment/Shells
License:        GPL
URL:            https://github.com/ssabchew/srvconfig/
Source0:        %{name}-%{version}.tar.gz

BuildRoot:      %{_tmppath}/%{name}-%{version}-%{release}-root-%(%{__id_u} -n)


%description
Collection of cron scsripts, coinfguration scripts/files.
Scripts to customize bash, alias and colors.
Also adds a prompt logging functionality.

%post
if [ $1 -eq 2 ]; then
    rm -rf /etc/profile.d/{aliases.sh,ps-twtty-7.sh,showcolors.sh}
fi

for i in aliases.sh ps-twtty-7.sh showcolors.sh ;do
 ln -s /etc/sty/$i /etc/profile.d/
done

%postun
if [ $1 -eq 0 ]; then
    rm -rf /etc/profile.d/{aliases.sh,ps-twtty-7.sh,showcolors.sh}
fi

%prep
%setup -q


%build


%install
rm -rf $RPM_BUILD_ROOT
mkdir -p %{buildroot}%{_sysconfdir}/sty/
cp -pa * %{buildroot}%{_sysconfdir}/sty/


%clean
rm -rf $RPM_BUILD_ROOT


%files
%dir %{_sysconfdir}/sty/configs/
%{_sysconfdir}/sty/configs/*
%{_sysconfdir}/sty/aliases.sh
%{_sysconfdir}/sty/ps-twtty-7.sh
%{_sysconfdir}/sty/showcolors

%defattr(0755,root,root,-)
%dir %{_sysconfdir}/sty/scripts/
%{_sysconfdir}/sty/scripts/*

%doc

%changelog

* Mon Aug 03 2015 Stiliyan Sabchew - 1:1.0-1
- initial build
