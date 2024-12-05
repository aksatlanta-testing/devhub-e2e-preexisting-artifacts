
{{- define "go-echo7ace4c1e-719c-4fed-9afb-e5281ec3def0.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo7ace4c1e-719c-4fed-9afb-e5281ec3def0.fullname" -}}
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


{{- define "go-echo7ace4c1e-719c-4fed-9afb-e5281ec3def0.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo7ace4c1e-719c-4fed-9afb-e5281ec3def0.labels" -}}
helm.sh/chart: {{ include "go-echo7ace4c1e-719c-4fed-9afb-e5281ec3def0.chart" . }}
{{ include "go-echo7ace4c1e-719c-4fed-9afb-e5281ec3def0.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo7ace4c1e-719c-4fed-9afb-e5281ec3def0.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo7ace4c1e-719c-4fed-9afb-e5281ec3def0.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}