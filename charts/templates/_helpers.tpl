
{{- define "go-echo974e1428-df75-4c4a-8ae7-7e48db2cf357.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo974e1428-df75-4c4a-8ae7-7e48db2cf357.fullname" -}}
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


{{- define "go-echo974e1428-df75-4c4a-8ae7-7e48db2cf357.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo974e1428-df75-4c4a-8ae7-7e48db2cf357.labels" -}}
helm.sh/chart: {{ include "go-echo974e1428-df75-4c4a-8ae7-7e48db2cf357.chart" . }}
{{ include "go-echo974e1428-df75-4c4a-8ae7-7e48db2cf357.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo974e1428-df75-4c4a-8ae7-7e48db2cf357.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo974e1428-df75-4c4a-8ae7-7e48db2cf357.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}