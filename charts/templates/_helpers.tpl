
{{- define "go-echo21b114a7-eb72-43ac-86f3-4d910300b54a.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo21b114a7-eb72-43ac-86f3-4d910300b54a.fullname" -}}
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


{{- define "go-echo21b114a7-eb72-43ac-86f3-4d910300b54a.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo21b114a7-eb72-43ac-86f3-4d910300b54a.labels" -}}
helm.sh/chart: {{ include "go-echo21b114a7-eb72-43ac-86f3-4d910300b54a.chart" . }}
{{ include "go-echo21b114a7-eb72-43ac-86f3-4d910300b54a.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo21b114a7-eb72-43ac-86f3-4d910300b54a.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo21b114a7-eb72-43ac-86f3-4d910300b54a.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}