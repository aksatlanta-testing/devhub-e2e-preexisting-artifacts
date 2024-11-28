
{{- define "go-echo69bb38f7-7ba7-4f50-be8a-de24da3fc695.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo69bb38f7-7ba7-4f50-be8a-de24da3fc695.fullname" -}}
{{- if .Values.fullnameOverride }}
{{- .Values.fullnameOverride | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- $name := default .Chart.Name .Values.nameOverride }}
{{- if contains $name .Release.Name }}
{{- .Release.Name | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" }}
{{- end }}
{{- end }}
{{- end }}


{{- define "go-echo69bb38f7-7ba7-4f50-be8a-de24da3fc695.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo69bb38f7-7ba7-4f50-be8a-de24da3fc695.labels" -}}
helm.sh/chart: {{ include "go-echo69bb38f7-7ba7-4f50-be8a-de24da3fc695.chart" . }}
{{ include "go-echo69bb38f7-7ba7-4f50-be8a-de24da3fc695.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo69bb38f7-7ba7-4f50-be8a-de24da3fc695.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo69bb38f7-7ba7-4f50-be8a-de24da3fc695.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}