
{{- define "go-echo4086c2b8-e652-4e7c-8b89-615500d0027f.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo4086c2b8-e652-4e7c-8b89-615500d0027f.fullname" -}}
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


{{- define "go-echo4086c2b8-e652-4e7c-8b89-615500d0027f.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo4086c2b8-e652-4e7c-8b89-615500d0027f.labels" -}}
helm.sh/chart: {{ include "go-echo4086c2b8-e652-4e7c-8b89-615500d0027f.chart" . }}
{{ include "go-echo4086c2b8-e652-4e7c-8b89-615500d0027f.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo4086c2b8-e652-4e7c-8b89-615500d0027f.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo4086c2b8-e652-4e7c-8b89-615500d0027f.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}