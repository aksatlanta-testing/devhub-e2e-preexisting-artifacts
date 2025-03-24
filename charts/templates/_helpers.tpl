
{{- define "go-echocda24194-9dfd-4fd3-850c-4c2440342a2f.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echocda24194-9dfd-4fd3-850c-4c2440342a2f.fullname" -}}
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


{{- define "go-echocda24194-9dfd-4fd3-850c-4c2440342a2f.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echocda24194-9dfd-4fd3-850c-4c2440342a2f.labels" -}}
helm.sh/chart: {{ include "go-echocda24194-9dfd-4fd3-850c-4c2440342a2f.chart" . }}
{{ include "go-echocda24194-9dfd-4fd3-850c-4c2440342a2f.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echocda24194-9dfd-4fd3-850c-4c2440342a2f.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echocda24194-9dfd-4fd3-850c-4c2440342a2f.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}