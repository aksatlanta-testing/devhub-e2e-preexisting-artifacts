
{{- define "go-echo5a938a2b-723b-473d-b54e-59012b832611.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo5a938a2b-723b-473d-b54e-59012b832611.fullname" -}}
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


{{- define "go-echo5a938a2b-723b-473d-b54e-59012b832611.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo5a938a2b-723b-473d-b54e-59012b832611.labels" -}}
helm.sh/chart: {{ include "go-echo5a938a2b-723b-473d-b54e-59012b832611.chart" . }}
{{ include "go-echo5a938a2b-723b-473d-b54e-59012b832611.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo5a938a2b-723b-473d-b54e-59012b832611.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo5a938a2b-723b-473d-b54e-59012b832611.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}