
{{- define "go-echo35b75c98-0ec3-49ee-b0bd-9aecb691538d.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo35b75c98-0ec3-49ee-b0bd-9aecb691538d.fullname" -}}
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


{{- define "go-echo35b75c98-0ec3-49ee-b0bd-9aecb691538d.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo35b75c98-0ec3-49ee-b0bd-9aecb691538d.labels" -}}
helm.sh/chart: {{ include "go-echo35b75c98-0ec3-49ee-b0bd-9aecb691538d.chart" . }}
{{ include "go-echo35b75c98-0ec3-49ee-b0bd-9aecb691538d.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo35b75c98-0ec3-49ee-b0bd-9aecb691538d.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo35b75c98-0ec3-49ee-b0bd-9aecb691538d.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}