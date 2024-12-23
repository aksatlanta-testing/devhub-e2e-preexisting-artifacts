
{{- define "go-echo6ff1ee33-6cd3-4168-867c-218e6548c782.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo6ff1ee33-6cd3-4168-867c-218e6548c782.fullname" -}}
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


{{- define "go-echo6ff1ee33-6cd3-4168-867c-218e6548c782.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo6ff1ee33-6cd3-4168-867c-218e6548c782.labels" -}}
helm.sh/chart: {{ include "go-echo6ff1ee33-6cd3-4168-867c-218e6548c782.chart" . }}
{{ include "go-echo6ff1ee33-6cd3-4168-867c-218e6548c782.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo6ff1ee33-6cd3-4168-867c-218e6548c782.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo6ff1ee33-6cd3-4168-867c-218e6548c782.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}