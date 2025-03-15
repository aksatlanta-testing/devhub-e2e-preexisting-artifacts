
{{- define "go-echof4ba3ad0-003c-4145-86c7-24dd7c90c9bb.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echof4ba3ad0-003c-4145-86c7-24dd7c90c9bb.fullname" -}}
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


{{- define "go-echof4ba3ad0-003c-4145-86c7-24dd7c90c9bb.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echof4ba3ad0-003c-4145-86c7-24dd7c90c9bb.labels" -}}
helm.sh/chart: {{ include "go-echof4ba3ad0-003c-4145-86c7-24dd7c90c9bb.chart" . }}
{{ include "go-echof4ba3ad0-003c-4145-86c7-24dd7c90c9bb.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echof4ba3ad0-003c-4145-86c7-24dd7c90c9bb.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echof4ba3ad0-003c-4145-86c7-24dd7c90c9bb.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}