
{{- define "go-echo731b6e61-add3-49cc-8652-cd4a270488cc.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo731b6e61-add3-49cc-8652-cd4a270488cc.fullname" -}}
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


{{- define "go-echo731b6e61-add3-49cc-8652-cd4a270488cc.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo731b6e61-add3-49cc-8652-cd4a270488cc.labels" -}}
helm.sh/chart: {{ include "go-echo731b6e61-add3-49cc-8652-cd4a270488cc.chart" . }}
{{ include "go-echo731b6e61-add3-49cc-8652-cd4a270488cc.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo731b6e61-add3-49cc-8652-cd4a270488cc.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo731b6e61-add3-49cc-8652-cd4a270488cc.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}