
{{- define "go-echo79ece38e-a55b-4256-a840-49c1b2a63ce2.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo79ece38e-a55b-4256-a840-49c1b2a63ce2.fullname" -}}
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


{{- define "go-echo79ece38e-a55b-4256-a840-49c1b2a63ce2.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo79ece38e-a55b-4256-a840-49c1b2a63ce2.labels" -}}
helm.sh/chart: {{ include "go-echo79ece38e-a55b-4256-a840-49c1b2a63ce2.chart" . }}
{{ include "go-echo79ece38e-a55b-4256-a840-49c1b2a63ce2.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo79ece38e-a55b-4256-a840-49c1b2a63ce2.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo79ece38e-a55b-4256-a840-49c1b2a63ce2.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}