Var CustomBits

${SegmentFile}

${Segment.OnInit}
	; Borrowed the following from PAL 2.2, Remove on release of PAL 2.2
	; Work out if it's 64-bit or 32-bit
	System::Call kernel32::GetCurrentProcess()i.s
	System::Call kernel32::IsWow64Process(is,*i.r0)
	${If} $0 == 0
	${OrIf} ${IsWinXP}
		StrCpy $CustomBits 32
		${SetEnvironmentVariablesPath} FullAppDir "$EXEDIR\App\JPEGView32"
	${Else}
		StrCpy $CustomBits 64
		${SetEnvironmentVariablesPath} FullAppDir "$EXEDIR\App\JPEGView"		
	${EndIf}
	StrCpy $Bits $CustomBits
!macroend

${SegmentInit}
	${If} $CustomBits != ""
		StrCpy $Bits $CustomBits
	${EndIf}
!macroend
