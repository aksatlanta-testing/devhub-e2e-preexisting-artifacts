
{{- define "go-echo2bb94b60-dd5d-47d8-baab-d4c87e21456b.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo2bb94b60-dd5d-47d8-baab-d4c87e21456b.fullname" -}}
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


{{- define "go-echo2bb94b60-dd5d-47d8-baab-d4c87e21456b.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo2bb94b60-dd5d-47d8-baab-d4c87e21456b.labels" -}}
helm.sh/chart: {{ include "go-echo2bb94b60-dd5d-47d8-baab-d4c87e21456b.chart" . }}
{{ include "go-echo2bb94b60-dd5d-47d8-baab-d4c87e21456b.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo2bb94b60-dd5d-47d8-baab-d4c87e21456b.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo2bb94b60-dd5d-47d8-baab-d4c87e21456b.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}