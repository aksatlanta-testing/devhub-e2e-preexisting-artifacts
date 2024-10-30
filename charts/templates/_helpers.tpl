
{{- define "go-echo84bd1286-293b-41f0-b342-740220aa112b.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo84bd1286-293b-41f0-b342-740220aa112b.fullname" -}}
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


{{- define "go-echo84bd1286-293b-41f0-b342-740220aa112b.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo84bd1286-293b-41f0-b342-740220aa112b.labels" -}}
helm.sh/chart: {{ include "go-echo84bd1286-293b-41f0-b342-740220aa112b.chart" . }}
{{ include "go-echo84bd1286-293b-41f0-b342-740220aa112b.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo84bd1286-293b-41f0-b342-740220aa112b.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo84bd1286-293b-41f0-b342-740220aa112b.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}