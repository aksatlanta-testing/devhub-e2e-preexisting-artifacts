
{{- define "go-echo705d1c4e-9a8c-4582-9b7b-21a860c46194.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo705d1c4e-9a8c-4582-9b7b-21a860c46194.fullname" -}}
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


{{- define "go-echo705d1c4e-9a8c-4582-9b7b-21a860c46194.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo705d1c4e-9a8c-4582-9b7b-21a860c46194.labels" -}}
helm.sh/chart: {{ include "go-echo705d1c4e-9a8c-4582-9b7b-21a860c46194.chart" . }}
{{ include "go-echo705d1c4e-9a8c-4582-9b7b-21a860c46194.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo705d1c4e-9a8c-4582-9b7b-21a860c46194.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo705d1c4e-9a8c-4582-9b7b-21a860c46194.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}